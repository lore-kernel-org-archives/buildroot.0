From: Freedreamer <freedreamer@email.it>
Date: Thu, 22 May 2014 14:08:33 +0200
Subject: [Buildroot] beagleBone remount FS systemd
Message-ID: <CAAs3wMhmNROnQb6wRuu7TVcEcpVrQJgzrjToCXnQbyeCjtVcVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all ,

I built with br a rootfs based on systemd on a beaglebone white. Everything
is ok except that i can't remount rootfs in rw with the systemd service
the service status says:

   Active: active (exited) since Sat 2000-01-01 02:29:56 UTC; 3min 57s ago
     Docs: man:systemd-remount-fs.service(8)
           http://www.freedesktop.org/wiki/Software/systemd/APIFileSystems
  Process: 73 ExecStart=/lib/systemd/systemd-remount-fs (code=exited,
status=0/SUCCESS)
 Main PID: 73 (code=exited, status=0/SUCCESS)
   CGroup: /system.slice/systemd-remount-fs.service

but no way to get it working.
If I remount manually with "mount -o remount rw /"  it works...

any idea?

thanks 4 the help

PS
im ' on rc5.2014 but same problem on the last release
Marco
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140522/4cf18ac9/attachment.html>
