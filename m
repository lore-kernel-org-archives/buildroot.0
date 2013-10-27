From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 27 Oct 2013 10:38:38 +0100
Subject: [Buildroot] [PATCH] Revert "berkeleydb: bump to version 6.0.20"
In-Reply-To: <1381174561-22507-1-git-send-email-jezz@sysmic.org>
 (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Mon, 7 Oct 2013 21:36:01 +0200")
References: <1381174561-22507-1-git-send-email-jezz@sysmic.org>
Message-ID: <87d2mrxdcx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

 > BerkeleyDB has changed its license since version 6. New license (AGPL) may
 > be incompatible with some packages. So we prefer to stick to version 5

 > This reverts commit 4c478de2e76ffc1d0a6dc413475307fd44a0a595.

Committed with the comment text adjusted as suggested by Yann, thanks.

-- 
Bye, Peter Korsgaard
