From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 28 Sep 2014 21:49:48 +0200
Subject: [Buildroot] [PATCH v2] package/mtd: install libubi.a and
	libmtd.a to staging
In-Reply-To: <1410082517-3435-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Sun, 7 Sep 2014 11:35:17 +0200")
References: <1410082517-3435-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87fvfbv82r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > Currently, the mtd package only installs the mtd utilities into the
 > target directory. However, the mtd-utils also provide two
 > static libraries (libmtd.a and libubi.a) that can be used by other
 > packages or tools.

 > Therefore, this commit extends the mtd package by adding the
 > installation to the staging directory of those two libraries.

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>
 > ---
 > v2: rewrite the commit message (Thomas Petazzoni)
 >     fix coding style (Thomas Petazzoni)

Committed, thanks.

-- 
Bye, Peter Korsgaard
