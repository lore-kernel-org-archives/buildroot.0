From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Date: Fri, 7 Aug 2020 11:51:02 +0200
Subject: [Buildroot] Root password and ssh issues
Message-ID: <12918ca7-601b-3a85-67bd-4b7953840a77@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

Manuel and I have observed a strange phenomenon at least with Buildroot
2020.02.4...

When we generate a root filesystem with Dropbear for ssh, and set the
root password through BR2_TARGET_GENERIC_ROOT_PASSWD, we cannot manage
to login through ssh.

However, we can login as root on the console with this password, proving
that the password was valid. If we then use the "passwd" command from
the command line on the target to set the same password again, ssh
access starts to work!

Would you have an explanation for this behavior?

Thanks,

Michael and Manuel

-- 
Michael Opdenacker, CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
