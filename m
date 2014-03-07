From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Mar 2014 22:55:02 +0100
Subject: [Buildroot] [PATCH 2/2] libenca: Move build host tool to
 PRE_BUILD_HOOKS
In-Reply-To: <1391390312-15662-2-git-send-email-maxime.hadjinlian@gmail.com>
References: <1391390312-15662-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1391390312-15662-2-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140307225502.50bcf795@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Mon,  3 Feb 2014 02:18:32 +0100, Maxime Hadjinlian wrote:
> The make_hash host tool, should be built during a PRE_BUILD_HOOKS and
> not a POST_CONFIGURE_HOOKS.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/libenca/libenca.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
