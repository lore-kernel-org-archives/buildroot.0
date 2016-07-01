From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 23:36:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/cmake: with BR2_ENABLE_DEBUG
 use RelWithDebInfo
In-Reply-To: <1463861314-15547-1-git-send-email-ckhardin@exablox.com>
References: <1463861314-15547-1-git-send-email-ckhardin@exablox.com>
Message-ID: <20160701233631.386e160b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 May 2016 13:08:34 -0700, Charles Hardin wrote:
> From the documentation on BR2_ENABLE_DEBUG, the intention is to get
> a build with debug symbols and not a "debug build" since that can have
> the unintended consequence of being a different code path then a
> release build type definition.
> 
> Switch the "Debug" to "RelWithDebInfo" in the cmake package support
> to accomodate getting the debug symbols and still be a release
> build.
> 
> Signed-off-by: Charles Hardin <ckhardin@exablox.com>
> ---
>  package/pkg-cmake.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
