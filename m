From: Eugen.Hristev at microchip.com <Eugen.Hristev@microchip.com>
Date: Mon, 28 Jun 2021 08:55:59 +0000
Subject: [Buildroot] Question on users and ssh access
Message-ID: <82f467ec-fbb3-9e87-be88-b5b51fc9b632@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,

Maybe you can help me with a small matter related to user accounts in 
Buildroot ?

By default the /home directory does not exist, thus when using adduser 
to create a user, the creation of /home/foo fails ... and this causes 
login with ssh to the user impossible due to lack of home dir.

Any recommendation on how to solve this ? It is preferred to set a 
password for root for ssh access (as root has /root as home) ? or add a 
post-script to create the /home in the rootfs ?

Thanks !
Eugen
