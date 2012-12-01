From: Stephan Hoffmann <sho@relinux.de>
Date: Sat, 01 Dec 2012 18:19:48 +0100
Subject: [Buildroot] Problem with NFS boot
In-Reply-To: <CADKZYY+nZbaXZbuG0D4RSR4N+GWQZKRALg0a7A0nZLNhMhd+rw@mail.gmail.com>
References: <CADKZYY+nZbaXZbuG0D4RSR4N+GWQZKRALg0a7A0nZLNhMhd+rw@mail.gmail.com>
Message-ID: <50BA3C34.7060205@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 01.12.2012 17:38, schrieb Santhosh Ramani:
> I must clarify that I am using the Linux kernel not built by Buildroot
> but by manually building from the TI SDK. So the only thing I use from
> Buildroot is the rootfs..it works fine when I untar it on my sd card,
> but doesn't seems to work over the network  Also I've selected udev
> option in buildroot.
How did you create the directory that you export via nfs? You have to
untar the target root created by buildroot using sudo.

Kind regards

Stephan

-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
