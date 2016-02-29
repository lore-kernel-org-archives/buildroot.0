From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 22:44:28 +0100
Subject: [Buildroot] [PATCH 02/32] package/systemd: remove
 BR2_PACKAGE_SYSTEMD_ALL_EXTRAS
In-Reply-To: <1456437341-19025-3-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
 <1456437341-19025-3-git-send-email-gabe@hashrabbit.co>
Message-ID: <20160229224428.7c1fdb89@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gabe Evans,

On Thu, 25 Feb 2016 21:55:11 +0000, Gabe Evans wrote:
> The option was a bit misleading since it only selected additional
> libraries without --enable/disabling any features. Including all of them
> here would add a lot of bloat so instead, it is replaced with notes
> detailing which features each library enables.
> 
> Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
> ---
>  package/systemd/Config.in  | 11 +++--------
>  package/systemd/systemd.mk | 16 ++++++++++------
>  2 files changed, 13 insertions(+), 14 deletions(-)

Applied to next with the following changes:

    [Thomas:
     - slightly tweak Config.in help text, as suggested by Arnout.
     - add Config.in.legacy handling for BR2_PACKAGE_SYSTEMD_ALL_EXTRAS,
       as suggested by Arnout.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
