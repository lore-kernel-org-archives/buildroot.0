From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Jun 2013 00:38:57 +0200
Subject: [Buildroot] [PATCH v10 05/13] webkit: bump to version 1.9.6
In-Reply-To: <1370647138-26623-6-git-send-email-spenser@gillilanding.com>
 (Spenser Gilliland's message of "Fri, 7 Jun 2013 18:18:50 -0500")
References: <1370647138-26623-1-git-send-email-spenser@gillilanding.com>
 <1370647138-26623-6-git-send-email-spenser@gillilanding.com>
Message-ID: <87bo7gb532.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Spenser" == Spenser Gilliland <spenser@gillilanding.com> writes:

 Spenser> Remove bison-2.6-compat patch as it has been incorporated upstream.
 Spenser> Remove fix build issue with old gtk as gtk has been bumped to a newer
 Spenser> version.
 Spenser> Remove fix-build-with-gcc-4-6 as it has incorporated upstream.
 Spenser> Remove directfb patches due to depreciation
 Spenser> Remove pool patch as it is no longer required
 Spenser> Remove pthread_getattr_np as webkit no longer uses this function.

Committed, thanks.

-- 
Bye, Peter Korsgaard
