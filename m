From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Mon, 28 Jun 2021 12:06:31 +0300
Subject: [Buildroot] Question on users and ssh access
In-Reply-To: <82f467ec-fbb3-9e87-be88-b5b51fc9b632@microchip.com>
References: <82f467ec-fbb3-9e87-be88-b5b51fc9b632@microchip.com>
Message-ID: <37078d3b-031f-8643-e200-62300beb1ae4@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

28.06.2021 11:55, Eugen.Hristev--- via buildroot wrote:
> Hello everyone,
> 
> Maybe you can help me with a small matter related to user accounts in
> Buildroot ?
> 
> By default the /home directory does not exist, thus when using adduser
> to create a user, the creation of /home/foo fails ... and this causes
> login with ssh to the user impossible due to lack of home dir.
> 
> Any recommendation on how to solve this ? It is preferred to set a
> password for root for ssh access (as root has /root as home) ? or add a
> post-script to create the /home in the rootfs ?
> 
> Thanks !
> Eugen
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

Try this:
https://buildroot.org/downloads/manual/manual.html#customize-users
