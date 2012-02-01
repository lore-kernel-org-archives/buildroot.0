From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 1 Feb 2012 15:15:57 +0000 (UTC)
Subject: [Buildroot] External Toolchain: Calculation of SYSROOT_DIR in
 toolchain/toolchain-external/ext-tool.mk wrong?
References: <4666169C600DD24C84F509DC90790D5007629FD2B5@DEMCHP99E75MSX.ww902.siemens.net>
 <20120201103842.546e6eb8@skate>
 <4666169C600DD24C84F509DC90790D5007629FD42D@DEMCHP99E75MSX.ww902.siemens.net>
 <20120201123447.71e90bc2@skate>
 <4666169C600DD24C84F509DC90790D5007629FD4B9@DEMCHP99E75MSX.ww902.siemens.net>
 <20120201140155.67edc41c@skate>
Message-ID: <jgbkvc$o5a$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-02-01, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> Le Wed, 1 Feb 2012 13:30:01 +0100,
> "Warlich, Christof" <christof.warlich@siemens.com> a ??crit :
>
>> I fully agree with you, but when I talked about the amount of effort, I
>> was referring to the effort that it would take me to convince management
>> to give away that code. I know from earlier experience how much (useless)
>> energy that may take.
>
> Ok. Do your management realize that a toolchain is mostly composed of
> gcc, binutils, uClibc and gdb, that all of these are distributed under
> GPL or LGPL licenses, and therefore you have to keep the source code
> open for those components in order to comply with their licenses?

For most of the toolchain, that's only true if they distribute
binaries.  Which they apparently do not do.  As long as they don't
distribute binaries of gcc, binutils, gdb, then they can keep the
sources to themselves can't they?

-- 
Grant Edwards               grant.b.edwards        Yow! I have a VISION!  It's
                                  at               a RANCID double-FISHWICH on
                              gmail.com            an ENRICHED BUN!!
