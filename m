From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 22:56:18 +0100
Subject: [Buildroot] [PATCH 13/32] package/systemd: add optional support
 for quotacheck
In-Reply-To: <1456437341-19025-14-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
 <1456437341-19025-14-git-send-email-gabe@hashrabbit.co>
Message-ID: <20160229225618.2a8088f5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gabe Evans,

On Thu, 25 Feb 2016 21:55:22 +0000, Gabe Evans wrote:
> Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
> ---
>  package/systemd/Config.in  | 9 +++++++++
>  package/systemd/systemd.mk | 6 ++++++
>  2 files changed, 15 insertions(+)

Applied to next after rewrapping the Config.in help text, which had
too long lines. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
