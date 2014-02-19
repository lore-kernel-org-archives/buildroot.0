From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 19 Feb 2014 23:33:36 +0100
Subject: [Buildroot] [PATCH v3 5/5] board: add support for the Fri2 board
In-Reply-To: <1392837022-15771-6-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 19 Feb 2014 20:10:22 +0100")
References: <1392837022-15771-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392837022-15771-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871tyyzq9q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  board/fri2/grub.cfg         |   6 +
 >  board/fri2/linux-3.8.config | 336 ++++++++++++++++++++++++++++++++++++++++++++
 >  board/fri2/post-build.sh    |   2 +
 >  board/fri2/readme.txt       |  40 ++++++
 >  configs/fri2_defconfig      |  23 +++

Like we discussed on IRC, it isn't really clear to me if this should be
called fri2 or kontron_m2m (or similar).

Perhaps linking to
https://www.yoctoproject.org/product/fish-river-island-2-board would
also be helpful.

Any opinions?


-- 
Bye, Peter Korsgaard
