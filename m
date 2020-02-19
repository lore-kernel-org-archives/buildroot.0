From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2020 08:23:14 +0100
Subject: [Buildroot] [PATCH] support/scripts/pkg-stats: properly ignore
 CVEs in <pkg>_IGNORE_CVES
In-Reply-To: <20200218233527.128481-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 19 Feb 2020 00:35:26 +0100")
References: <20200218233527.128481-1-thomas.petazzoni@bootlin.com>
Message-ID: <878skzdorh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > It seems like throughout the series that the CVE pkg-stats support
 > went through, the support for ignoring CVEs in the per-package
 > <pkg>_IGNORE_CVES variable was forgotten.

 > Let's re-introduce this, which is now very simple thanks to the CVE
 > class, its .identifier() propertly and the .is_cve_ignored() method of
 > the Package class

 > Cc: Titouan Christophe <titouan.christophe@railnova.eu>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
