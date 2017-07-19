From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 18:18:15 +0200
Subject: [Buildroot] [PATCH] tiff: add upstream security fix for
	CVE-2017-10688
In-Reply-To: <20170714142426.1041-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 14 Jul 2017 16:24:26 +0200")
References: <20170714142426.1041-1-peter@korsgaard.com>
Message-ID: <87pocw7648.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2017-10688 - n LibTIFF 4.0.8, there is a assertion abort in the
 > TIFFWriteDirectoryTagCheckedLong8Array function in tif_dirwrite.c.  A
 > crafted input will lead to a remote denial of service attack.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
