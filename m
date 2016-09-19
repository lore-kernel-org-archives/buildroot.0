From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Sep 2016 22:42:14 +0200
Subject: [Buildroot] [PATCH 4/4 v2] manual: get rid of the lists of
	packages
In-Reply-To: <20160919194729.607d2c8d@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 19 Sep 2016 19:47:29 +0200")
References: <cover.1472943074.git.yann.morin.1998@free.fr>
 <206a0e9bf7a1e99fa176fe1345d245881f14b858.1472943074.git.yann.morin.1998@free.fr>
 <20160919194729.607d2c8d@free-electrons.com>
Message-ID: <874m5b62qh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,
 >> ---
 >> docs/manual/appendix.txt            |   32 +-
 >> docs/manual/manual.mk               |   21 +-
 >> support/scripts/gen-manual-lists    |   62 +
 >> support/scripts/gen-manual-lists.py |  513 -----
 >> support/scripts/kconfiglib.py       | 3541 -----------------------------------
 >> support/scripts/readme.kconfiglib   |   30 -
 >> 6 files changed, 67 insertions(+), 4132 deletions(-)
 >> create mode 100755 support/scripts/gen-manual-lists
 >> delete mode 100644 support/scripts/gen-manual-lists.py
 >> delete mode 100644 support/scripts/kconfiglib.py
 >> delete mode 100644 support/scripts/readme.kconfiglib

 > Nobody really gave any opinion. I had some quick discussion with Peter
 > in private on IRC, and he seemed to be in favor of completely dropping
 > the list of packages from the manual.

 > So: patch applied. Thanks a lot!

Yes, indeed - Sorry, I didn't apply the patch yet, I got caught up in
real life stuff (tm).

-- 
Bye, Peter Korsgaard
