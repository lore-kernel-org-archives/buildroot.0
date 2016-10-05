From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 09:56:01 +0200
Subject: [Buildroot] [PATCH v2] elfutils: clarify licensing info
In-Reply-To: <1475622868-27338-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1475622868-27338-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20161005095601.2a236f1d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Oct 2016 20:14:28 -0300, gustavo.zacarias at free-electrons.com
wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> elfutils libraries are GPLv2+ or LGPLv3+, standalone programs are GPLv3+
> (see the NEWS file).
> Make the GPLv3+ license tag/file dependant on the programs being
> enabled, and make the GPLv2+/LGPLv3+ tag more descriptive.
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/elfutils/elfutils.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
