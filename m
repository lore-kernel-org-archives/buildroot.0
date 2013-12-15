From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Dec 2013 13:52:42 +0100
Subject: [Buildroot] [PATCHv2 32/36] python-pyasn: new package
In-Reply-To: <1386793631-14026-33-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 11 Dec 2013 21:27:07 +0100")
References: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386793631-14026-33-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a9g2wa1x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > From: Ryan Barnett <ryanbarnett3@gmail.com>
 > Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 > +################################################################################
 > +#
 > +# python-pyasn
 > +#
 > +################################################################################
 > +
 > +PYTHON_PYASN_VERSION = 1.2
 > +PYTHON_PYASN_SOURCE = PyASN-$(PYTHON_PYASN_VERSION).zip
 > +PYTHON_PYASN_SITE = https://pyasn.googlecode.com/files
 > +PYTHON_PYASN_LICENSE = LGPL

Version?

Looking closer, there's no license files included, but the file header
of pyasn.cpp states LGPLv3+ and the stuff under libgds states GPLv2+, so
I've changed it to that and committed, thanks.

-- 
Bye, Peter Korsgaard
