From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Feb 2016 14:51:17 +0100
Subject: [Buildroot] [PATCH] uclibc: fix testsuite
In-Reply-To: <1455113878-32655-1-git-send-email-gustavo@zacarias.com.ar>
References: <1455113878-32655-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160212145117.19fd6277@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 10 Feb 2016 11:17:58 -0300, Gustavo Zacarias wrote:
> Unless the tests are built with TEST_INSTALLED_UCLIBC their rpath will
> point to the build directory rather than runtime directory, resulting in
> non-executable tests for the target.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/uclibc/uclibc.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
