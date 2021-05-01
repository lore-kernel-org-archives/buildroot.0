From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 01 May 2021 14:17:41 +0200
Subject: [Buildroot] [PATCH 1/3] package/makedevs: define extract step
 to allow patching
In-Reply-To: <20210426214628.20941-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 26 Apr 2021 23:46:26 +0200")
References: <20210426214628.20941-1-peter@korsgaard.com>
Message-ID: <87o8du642i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > As recently discussed on the list:
 > http://lists.busybox.net/pipermail/buildroot/2021-April/308373.html

 > Packages like makedevs where the source code is included in the Buildroot
 > tree, currently doesn't use an extract step (which also skips the patch
 > step), so they cannot be patched by a patch in BR2_GLOBAL_PATCH_DIR (or the
 > pkgdir), which is a bit confusing.

 > As a fix, add a simple extract step that copies the source file to the build
 > directory, so the patch step gets run as well.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
