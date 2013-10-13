From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
Date: Sun, 13 Oct 2013 12:48:03 +0200
Subject: [Buildroot] [PATCH] toolchain-external: add a specific check to
 avoid Angstrom toolchains
In-Reply-To: <1381572882-22592-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1381572882-22592-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131013124803.2044e4c3@e6520eb>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le Sat, 12 Oct 2013 12:14:42 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :
> To avoid this problem in the future, we explicitly check if the
> toolchain is from Angstrom by looking at the vendor part of the tuple
> exposed by the toolchain: as soon as it is
> <something>-angstrom-<something-else>, we reject the toolchain with an
> explanation.
> 
maybe you should also check for at least "oe" and "poky" as these are
the vendor part of toolchains generated with plain OE-Core or
Yocto/Poky.

Eric
