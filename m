From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Thu, 18 Apr 2013 09:16:08 +0200 (CEST)
Subject: [Buildroot] RFC: "make emu" build and start QEMU target
In-Reply-To: <CAEBucnDgqjO+3RpdXOgqJzkitSG6P-L=cbOEJws09WZXnnD5kQ@mail.gmail.com>
Message-ID: <511091893.1715486.1366269368744.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Mail original -----
> Hi,
> 
> I'm proposing a project where a "make emu" target would be added to
> Buildroot in order to start a virtualized version of the target.
>  This
> would provide developers with the ability to quickly test and
> validate
> their configuration.


I'd be interested in that, I have a few patch for qemu flying around
and having a quick way to test them would help

(I know testing qemu is not the point of your patch, but it would 
be usefull for that)

> 
> To configure the emu target a new top-level menu, "Target Emulation,"
> would be added.  This menu would contain the following options.
> 
> Emulation Method -> QEMU
> QEMU Version -> Custom Git Tree | Custom tarball | Custom Version |
> X.Y.Z
> ... Source Configuration similar to Kernel ...
> Machine -> list of machines
> Memory -> Memory in Megabytes
> Additional QEMU Options -> (additional options for command line)
> 
> This will start the qemu-system-$(ARCH) version of QEMU with the
> appropriate configuration.
> 

hmm... not sure if target emulation makes sense as a separate entry 
or if the qemu targets should be simply different machines.


> Thanks,
> Spenser
> 
> --
> Spenser Gilliland
> Computer Engineer
> Doctoral Candidate
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
