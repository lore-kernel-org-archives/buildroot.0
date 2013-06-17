From: elham abbaszade <k84.834@gmail.com>
Date: Mon, 17 Jun 2013 16:13:47 +0430
Subject: [Buildroot] systemctl failed to get Dbus connection: No connection
	to service manager
Message-ID: <CAEiLu=W5GMxYkMpsfNP+oSjswdMqp72xHR1iQ6VCB0_MpmxMEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi every body
I works on buildroot for some days.
now I have an issue with systemctl.
in fact, I want to initialize and start lighttpd.
according to this page <https://wiki.archlinux.org/index.php/Lighttpd>, I
want to run "systemctl start lighttpd" to initialize lighttpd server.
but I face with "systemctl failed to get Dbus connection: No connection to
service manager" error.
I have searched and find that I must boot with systemd.
I must create some symlinks to boot with systemd

when I run "cat /proc/1/comm" I have received: "init" instead of systemd.

after I create symlinks like " ln -sf /usr/lib/systemd/systemd /sbin/init"
and reboot the system, my boot crash before init step.

have any one any suggestion?!
thanks from all
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130617/0c227fc8/attachment.html>
