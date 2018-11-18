From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Nov 2018 21:15:32 +0100
Subject: [Buildroot] [PATCH] binutils: Get rid of obsolete patches
In-Reply-To: <80cbbaa5-d6b7-3a85-43a6-82ae94859876@gmail.com> (Romain Naour's
 message of "Sat, 27 Oct 2018 09:46:33 +0200")
References: <20181021181830.12667-1-abrodkin@synopsys.com>
 <80cbbaa5-d6b7-3a85-43a6-82ae94859876@gmail.com>
Message-ID: <87ftvym9az.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Hi Alexey,
 > Thanks for doing this :)

 > Le 21/10/2018 ? 20:18, Alexey Brodkin a ?crit?:
 >> Some patches for Binutils seems to not be really needed.
 >> Moreover for some of them I was not able to find any justification
 >> for their introduction.

 > Those patches are annoying while bumping the binutils version, I never figured
 > out why there are in Buildroot.

 >> 
 >> 1. 0002-ld-makefile.patch
 >> 
 >> This one I may track down to at least 2.15.92.0.2 here [1].
 >> Commit message just says: "Integrate some debian patches,
 >> extracted from binutils_2.15-4.diff"
 >> 
 >> But in OpenEmbedded they got rid of it long ago on switch to 2.26, see [2].
 >> 
 >> 2. 0003-check-ldrunpath-length.patch
 >> 
 >> The same story here.
 >> 
 >> 3. 0004-add-sysroot-fix-from-bug-3049.patch
 >> 
 >> Bug mentioned in this patch was marked as "fixed" in 2012, see [3].

 > Based on the commit date, this patch is part of Binutils 2.23 release.

 > Reviewed-by: Romain Naour <romain.naour@gmail.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
