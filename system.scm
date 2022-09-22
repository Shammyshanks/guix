;; This is an operating system configuration generated
;; by the graphical installer.
;; sudo guix systme reconfigure ~/.config/guix/system.scm

(use-modules (gnu)(nongnu packages linux))
(use-service-modules desktop networking ssh xorg)
(use-package-modules wm xorg )

(operating-system
 (kernel linux)
 (firmware (list linux-firmware))
  (locale "en_US.utf8")
  (timezone "America/Los_Angeles")
  (keyboard-layout (keyboard-layout "us"))
  (host-name "megatron")
  (users (cons* (user-account
                  (name "thor")
                  (comment "Thor")
                  (group "users")
                  (home-directory "/home/thor")
                  (supplementary-groups
                    '("wheel" "netdev" "audio" "video")))
                %base-user-accounts))
  (packages (append (list
		     herbstluftwm
		     stumpwm

		     
		     (specification->package "nss-certs"))
      %base-packages))
  (services
    (append
      (list (service xfce-desktop-service-type)
            (set-xorg-configuration
              (xorg-configuration
                (keyboard-layout keyboard-layout))))
      %desktop-services))
  (bootloader
    (bootloader-configuration
      (bootloader grub-bootloader)
      (targets "/dev/sda")
      (keyboard-layout keyboard-layout)))
  (swap-devices
    (list (uuid "45eab48e-cd27-4c56-b51b-9ec824276a67")))
  (file-systems
    (cons* (file-system
             (mount-point "/")
             (device
               (uuid "55ac9564-d942-4277-9cb9-3d6e191ec0f3"
                     'ext4))
             (type "ext4"))
           %base-file-systems)))
