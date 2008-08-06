From: Sean Perry <shaleh@speakeasy.net>
Date: Tue, 05 Aug 2008 21:32:56 -0700
Subject: [Buildroot] many "/etc/mdev.conf: No such file or directory"
 when	boot up
In-Reply-To: <386b1f6d0808041105t574c48fcsc83eee2d2b9e4bfb@mail.gmail.com>
References: <386b1f6d0808041105t574c48fcsc83eee2d2b9e4bfb@mail.gmail.com>
Message-ID: <48992978.2000502@speakeasy.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew Ma wrote:
> Hello,
> 
> I have compiled and make a very simple (no optional package) ISO rootfs 
> image for x86.  I see many of these mdev.conf messages.  I have seen 
> some other thread or post mention to copied mdev.conf from other target 
> to "target/generic/target_skeleton/etc/".  However, that would cause 
> some messages like "cannot find tty[2-4]". Is there a correct way to 
> solve this "mdev.conf" error messages ?
> 

mdev is the busybox udev replacement. It is a simple config file with a 
readme in the busybox source in project_build_$(ARCH)/$(PROJECT)/busybox.
