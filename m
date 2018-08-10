From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Aug 2018 11:44:11 +0200
Subject: [Buildroot] [PATCH] busybox: bump version to 1.29.2
In-Reply-To: <20180809221219.1838-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 10 Aug 2018 00:12:19 +0200")
References: <20180809221219.1838-1-peter@korsgaard.com>
Message-ID: <87eff6eetw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Includes fixes for fdisk (compat fixes, allow 2TB+ sizes), gzip
 > (FEATURE_GZIP_LEVELS was producing badly-compressed .gz), hexedit (segfault
 > fix).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
