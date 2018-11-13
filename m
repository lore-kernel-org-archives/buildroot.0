From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Nov 2018 23:52:17 +0100
Subject: [Buildroot] [PATCH] tar: adjust Config.in comment dependency
In-Reply-To: <20181026173353.9779-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 26 Oct 2018 19:33:53 +0200")
References: <20181026173353.9779-1-thomas.petazzoni@bootlin.com>
Message-ID: <87sh04y4im.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Since commit 916b21a7fbf266f452b8dc4116133cc57fdad269 ("package/tar:
 > Depends on MMU"), BR2_PACKAGE_TAR depends on BR2_USE_MMU. However, the
 > Config.in comment does not take into account this dependency, an
 > inconsistency which is fixed by this commit.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
