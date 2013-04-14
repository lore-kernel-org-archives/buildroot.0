From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Apr 2013 21:24:04 +0200
Subject: [Buildroot] [PATCH] boost: bump version to 1.53.0
In-Reply-To: <1360168036-1073-1-git-send-email-victor.hiairrassary.ml@gmail.com>
 (victor hiairrassary ml's message of "Wed, 6 Feb 2013 17:27:16 +0100")
References: <1360168036-1073-1-git-send-email-victor.hiairrassary.ml@gmail.com>
Message-ID: <8761zoq5kb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "victor" == victor hiairrassary ml <victor.hiairrassary.ml@gmail.com> writes:

 victor> From: Victor Hiairrassary <victor.hiairrassary.ml@gmail.com>
 victor> and re-enable boost context library since its compilation with
 victor> uClibc is fixed. Disable new atomic library because it can not
 victor> compile with uClibc (fixed in upstream version).

Committed, thanks.

-- 
Bye, Peter Korsgaard
