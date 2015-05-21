From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 12:04:01 +0200
Subject: [Buildroot] [PATCH v2 1/1] autobuild web/rss: Fix base url for
 results
In-Reply-To: <1432107719-29817-1-git-send-email-lionel.orry@gmail.com>
References: <1432107719-29817-1-git-send-email-lionel.orry@gmail.com>
Message-ID: <20150521120401.2841faba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lionel Orry,

On Wed, 20 May 2015 09:41:59 +0200, Lionel Orry wrote:
> This commit fixes the base url previously pointing at
> http://buildroot.humanoidz.org to the right base url
> http://autobuild.buildroot.org.
> 
> Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - Correct the commit short text which was wrong

Applied to buildroot-test, thanks.

However, the "autobuild" part should not be part of the commit title.
For your next buildroot-test patches, I would rather suggest that you
do:

	git format-patch --subject-prefix="PATCH buildroot-test"

This way, the title will be:

	[PATCH buildroot-test] <something>

It allows to identify that the patch is not for Buildroot, but also to
not have the "buildroot-test" string part of the commit title when the
patch is applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
