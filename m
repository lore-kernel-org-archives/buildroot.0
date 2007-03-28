From: nathanael at gnat.ca <nathanael@gnat.ca>
Date: Wed, 28 Mar 2007 14:02:54 -0700
Subject: [Buildroot] how i can crosscompiling mysql with buildroot
In-Reply-To: <20070328153601.49940@gmx.net>
References: <20070328153601.49940@gmx.net>
Message-ID: <20070328140254.5pzl1fco0kgcsws8@webmail.gnat.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting Stephan Raue <stephan.raue@gmx.net>:

> Hi,
>
> i need a "working" mysql.mk (version 5.0.xx or version 4.xx) for   
> buildroot to build MySQL Server and Client, does anyone know where i  
>  can get this? Or where i can get patches and instructions to   
> crosscompiling mysql with uclibc (buildroot)?

I think mysql has issues when cross compiling, and I don't think it  
supports it. The way I *think* I remember getting mysql build against  
uclibc was to chroot into the staging dir or use a temporary rootfs  
with the toolchain in it. Then build mysql directly in the root fs  
there.
