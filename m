From: Daniel Mack <daniel@caiaq.de>
Date: Fri, 24 Jul 2009 10:42:41 +0200
Subject: [Buildroot] Execute Makefile before genrate rootfs
In-Reply-To: <4A696C94.4070905@fpga-art.de>
References: <4A696C94.4070905@fpga-art.de>
Message-ID: <20090724084241.GK13236@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 24, 2009 at 10:11:00AM +0200, Lars Lockenvitz wrote:
> I'm looking for a way to execute a Makefile or script after all packages  
> are build and installed but befor buildroot is generating the rootfs 
> filr.
> The reason is that for different projects I maybe need the same  
> platform, packages and so on, but different settings for example in  
> inittab or other coniguration files.

We had the same demand, and I submitted a patch to do exactly that some
weeks ago. It was found to be useful by people, and we're actively using
it here in our tree, but it hasn't been commited to mainline yet.

I've attached it again, at least for you to pick it :)

Daniel
