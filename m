From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Sat, 1 Apr 2017 00:23:36 +0200
Subject: [Buildroot] python: move to Git formatted patches
Message-ID: <ef3812a0-4628-8d2c-3b6e-294a1cc1cc3c@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I just started a new hobby project using buildroot (of course) and stumbled across a problem with Python not finding its zlib module...
There's an old bug about it (https://bugs.busybox.net/show_bug.cgi?id=7971) directing me to
https://git.buildroot.net/buildroot/commit/package/python?id=238bf198cf4f31a3301b81a924d5e22044945955
which sadly was (unintentionally?) reverted by:

commit 652076293235276e2f978fe377322a6cbd615455
Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date:   Wed Mar 8 00:00:26 2017 +0100

    python: move to Git formatted patches
    
    Now that the cpython project has a nice Github repository, with tags,
    it's much nicer to handle the stack of Python patches with Git. The
    python3 package patches had already been converted, but not the python
    package patches. Therefore, this commit does the move.
    
    There is no functional change, only reformatting of the patches.

Should I send a patch to add it back, or is there something I don't see?
