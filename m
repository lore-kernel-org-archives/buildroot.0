From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 Feb 2021 10:27:59 +0100
Subject: [Buildroot] [PATCH] package/binutils: bump 2.36.x series to
 2.36.1
In-Reply-To: <20210206201120.2526054-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 6 Feb 2021 21:11:19 +0100")
References: <20210206201120.2526054-1-thomas.petazzoni@bootlin.com>
Message-ID: <87y2g02pnk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Release notes:
 >   We are very sorry to have to report that a problem was found with the
 >   GNU Binutils 2.36 release.  It turns out that it contained a small
 >   portion of code that was not covered by an FSF copyright assignment.
 >   So we have created a replacement release - 2.36.1 - with that code
 >   removed.

 >   In addition we found that a fix for a theoretical security
 >   vulnerability[1] was itself broken and could result in the archiver
 >   program "ar" misbehaving.  So we have chosen to revert the fix from
 >   the 2.36.1 release whilst the problem is properly resolved.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
