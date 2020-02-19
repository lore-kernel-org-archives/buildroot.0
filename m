From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2020 08:23:29 +0100
Subject: [Buildroot] [PATCH] package/libxml2: properly set
 LIBXML2_IGNORE_CVES
In-Reply-To: <20200218233647.128671-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 19 Feb 2020 00:36:46 +0100")
References: <20200218233647.128671-1-thomas.petazzoni@bootlin.com>
Message-ID: <874kvndor2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The libxml2 package has two patches that fix the two CVEs affecting
 > libxml2 in version 2.9.10, so let's use LIBXML2_IGNORE_CVES to ensure
 > these CVEs are no longer reported by pkg-stats.

 > Cc: Titouan Christophe <titouan.christophe@railnova.eu>
 > Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
