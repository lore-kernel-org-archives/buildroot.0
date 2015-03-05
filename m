From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Mar 2015 22:45:13 +0100
Subject: [Buildroot] [PATCH] mipsel-ctng-linux-uclibc.config: add
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
In-Reply-To: <1425549917-31392-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1425549917-31392-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150305224513.3865e7ab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 5 Mar 2015 10:05:17 +0000, Vicente Olivert Riera wrote:
> This external toolchain has C++ support, so add
> BR2_TOOLCHAIN_EXTERNAL_CXX=y to the config file.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  .../configs/mipsel-ctng-linux-uclibc.config        |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Applied, thanks.

Next time, can you include some special thing within the [PATCH ...]
text to indicate that this patch is for buildroot-test and not
Buildroot? I.e, use:

	git format-patch --subject-prefix="PATCH buildroot-test"

Otherwise it's a bit annoying to differentiate buildroot-test patches
from other patches in patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
