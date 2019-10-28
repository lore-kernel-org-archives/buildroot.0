From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Oct 2019 10:42:09 +0100
Subject: [Buildroot] [PATCH] package/unscd: bump version
In-Reply-To: <20191005235546.129b9028@windsurf.home> (Thomas Petazzoni's
 message of "Sat, 5 Oct 2019 23:55:46 +0200")
References: <20190929170809.22598-1-yann.morin.1998@free.fr>
 <20191005235546.129b9028@windsurf.home>
Message-ID: <87d0eh8avi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Sun, 29 Sep 2019 19:08:09 +0200
 > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

 >> Version 0.53 has a fix for INVALIDATE and SHUTDOWN requests being
 >> ignored.
 >> 
 >> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 >> Cc: Doug Kehn <rdkehn@yahoo.com>
 >> ---
 >> package/unscd/unscd.hash | 2 +-
 >> package/unscd/unscd.mk   | 2 +-
 >> 2 files changed, 2 insertions(+), 2 deletions(-)

 > Applied to master, thanks.

Yann: Given the bugfixes, should this be applied to 2019.02.x and
2019.08.x as well?

-- 
Bye, Peter Korsgaard
