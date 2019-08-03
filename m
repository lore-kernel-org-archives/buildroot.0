From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 10:42:24 +0200
Subject: [Buildroot] [PATCH v2 2/4] board/raspberrypi: add support for
 the new pi4
In-Reply-To: <20190629183240.16035-2-michael@michaelcullen.name> (Michael
 Cullen's message of "Sat, 29 Jun 2019 19:32:38 +0100")
References: <20190629183240.16035-1-michael@michaelcullen.name>
 <20190629183240.16035-2-michael@michaelcullen.name>
Message-ID: <87mugqod1r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Cullen <michael@michaelcullen.name> writes:

 > This is based on the pi3 defconfig. There is currently no 64-bit support
 > since the upstream kernel does not build in this configuration.

 > Signed-off-by: Michael Cullen <michael@michaelcullen.name>

 > ---
 > V1 -> V2 Diff:
 > * Fixed various mistakes in the readme file
 > * Reverted a change (WRT the pi3 config) of the boot filesystem size
 >   - this was changed while I was testing and I forgot to change it back
 > * Stripped down boot partition to necessary files
 >   - Specifically, removed the start.elf and fixup.dat files for other versions

Committed, thanks.

-- 
Bye, Peter Korsgaard
