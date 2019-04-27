From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Apr 2019 18:28:37 +0200
Subject: [Buildroot] [PATCH] package/libpng: security bump to version
 1.6.37
In-Reply-To: <20190427114242.3499-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 27 Apr 2019 13:42:42 +0200")
References: <20190427114242.3499-1-peter@korsgaard.com>
Message-ID: <87lfzvtnt6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > CVE-2019-7317: png_image_free in png.c in libpng 1.6.36 has a use-after-free
 > because png_image_free_function is called under png_safe_execute.

 > Update license hash for a change in copyright year and typo fixes.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
