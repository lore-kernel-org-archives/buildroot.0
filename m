From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 23 Feb 2010 23:51:25 +0100
Subject: [Buildroot] Newbie: AT91SAM9260 NAND Boot
In-Reply-To: <815f0bd71002221951v606dbdddn381587fdd662e485@mail.gmail.com>
	(Roo's message of "Tue, 23 Feb 2010 14:51:37 +1100")
References: <815f0bd71002221951v606dbdddn381587fdd662e485@mail.gmail.com>
Message-ID: <87tyt7d0r6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Roo" == Roo  <roo.watt@gmail.com> writes:

Hi,

 Roo> I would like to use buildroot to build the rootfs, kernel and tools
 Roo> required for our application. I would appreciate any advice on where
 Roo> to start with this, is there any reason that a NAND boot defconfig
 Roo> does not exist currently? Will it be a difficult job to develop one? I
 Roo> know that there is a rootsf image and kernel image at at91.com but I
 Roo> see more value in supporting the latest buildroot particularly as I
 Roo> would like to integrate our own packages.

It shouldn't be much of a problem. Basically you just need to decide
what pakcages you want to include and then what kind of filesystem you
want to use on your NAND flash (E.G. jffs2), and then configure that.

 Roo> Also can anyone advise whether there are issues building on a
 Roo> 64bit host?  Any advice appreciated.

No, I only use 64bit machines.

-- 
Bye, Peter Korsgaard
