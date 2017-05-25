From: Riko Ho <antonius.riko@gmail.com>
Date: Thu, 25 May 2017 10:03:00 +0800
Subject: [Buildroot] systemd question?
Message-ID: <6ed89ee4-7373-2e12-0919-4e6e7a227673@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Everyone,

I tried to start with systemd initialization and got this message below:

=====

You are in emergency mode. After logging in, typ/bin/sh: 
/home/bianchi77/buildrd
You are in emergency mode. After logging in, type "journalctl -xb" to view
system logs, "systemctl reboot" to reboot, "systemctl default" or ^D to
try again to boot into default mode.
/bin/sh: /home/bianchi77/buildroot/output/host/usr/sbin/sulogin: not found
You are in emergency mode. After logging in, type "journalctl -xb" to view
system logs, "systemctl reboot" to reboot, "systemctl default" or ^D to
try again to boot into default mode.
/bin/sh: /home/bianchi77/buildroot/output/host/usr/sbin/sulogin: not found
You are in emergency mode. After logging in, type "journalctl -xb" to view
system logs, "systemctl reboot" to reboot, "systemctl default" or ^D to
try again to boot into default mode.
/bin/sh: /home/bianchi77/buildroot/output/host/usr/sbin/sulogin: not found
You are in emergency mode. After logging in, type "journalctl -xb" to view
system logs, "systemctl reboot" to reboot, "systemctl default" or ^D to
try again to boot into default mode.
/bin/sh: /home/bianchi77/buildroot/output/host/usr/sbin/sulogin: not found
You are in emergency mode. After logging in, type "journalctl -xb" to view
system logs, "systemctl reboot" to reboot, "systemctl default" or ^D to
try again to boot into default mode.
/bin/sh: /home/bianchi77/buildroot/output/host/usr/sbin/sulogin: not found
You are in emergency mode. After logging in, type "journalctl -xb" to view
system logs, "systemctl reboot" to reboot, "systemct/bin/sh: 
/home/bianchi77/bud
====

What do you reckon I missed here ? thanks
-- 
*

/*******/
Sent by Ubuntu LTS 16.04,
??,
Regards,
Riko Ho
/*******/

*
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170525/7b4422d0/attachment.html>
