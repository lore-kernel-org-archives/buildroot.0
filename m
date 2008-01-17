From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 17 Jan 2008 18:41:47 +0100
Subject: [Buildroot] buildroot building problems
In-Reply-To: <53499b480801170917v714fca95t17138a23d0740905@mail.gmail.com>
References: <53499b480801170741m1cee5028q2fc41f1a52b3fd6f@mail.gmail.com>
	<20080117160206.GB3086@aon.at>
	<53499b480801170917v714fca95t17138a23d0740905@mail.gmail.com>
Message-ID: <20080117174147.GA3609@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 17, 2008 at 08:17:28PM +0300, Yegor Masharsky wrote:
>Hello Bernhard ,
>
>grep KCONFIG .config returns
>BR2_PACKAGE_LINUX_KCONFIG=""
>
>docs/README says :
>
>1) run 'make menuconfig'
>2) select the packages you wish to compile
>3) run 'make'
>4) wait while it compiles
>5) Use your shiny new root filesystem.  Depending on which sortof
>   root filesystem you selected, you may want to loop mount it,
>   chroot into it, nfs mount it on your target device, burn it
>   to flash, or whatever is appropriate for your target system.
>
>So I fail at step 4 but don't see where I missed something

read on, your're not EOF there :)
