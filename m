From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Sep 2014 23:46:49 +0200
Subject: [Buildroot] [PATCH 1/2] libffi: make thread support optional
In-Reply-To: <1410678059-12446-1-git-send-email-jezz@sysmic.org>
 (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Sun, 14 Sep 2014 09:00:58 +0200")
References: <1410678059-12446-1-git-send-email-jezz@sysmic.org>
Message-ID: <877g1550za.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

 > From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Fixes:

 >   http://autobuild.buildroot.org/results/7ee57d01917ea72d1811469e482513dda2ceb1ea/build-end.log

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
 > ---

 > This patch was alread sent here:
 >   http://lists.busybox.net/pipermail/buildroot/2012-November/061976.html

 > It is a better solution than simply disable libffi (and all its dependencies).

What about my comments to that patch?

http://lists.busybox.net/pipermail/buildroot/2012-November/061980.html

-- 
Bye, Peter Korsgaard
