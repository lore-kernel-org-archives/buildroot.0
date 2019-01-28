From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Jan 2019 22:09:05 +0100
Subject: [Buildroot] [PATCH 1/1] minizip: disable compatibility headers
In-Reply-To: <20190128200407.27306-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 28 Jan 2019 21:04:07 +0100")
References: <20190128200407.27306-1-fontaine.fabrice@gmail.com>
Message-ID: <874l9scwwe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > minizip enables zip.h and unzip.h compatibility headers since version
 > 2.7.2 and
 > https://github.com/nmoinvaz/minizip/commit/1b2b32c8b8c7ea441b14a2fd827d7e2dc886776c

 > This is an issue as php fails to build if minizip is built after libzip
 > because minizip installs a zip.h header without zip_stat, ZIP_CREATE,
 > ZIP_FL_NOCASE, zip_fopen, etc ...

 > So until the compatibility headers are enhanced/fixed in minizip, disable them

 > Fixes:
 >  - http://autobuild.buildroot.org/results/7b41f4e4a521b1e17aa885aac4419b26e0dd8700

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
