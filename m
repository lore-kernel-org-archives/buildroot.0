From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Jul 2017 08:47:33 +0200
Subject: [Buildroot] [v7] package: add qt5virtualkeyboard
In-Reply-To: <20170401223651.6393-1-gael.portay@savoirfairelinux.com>
References: <20170401223651.6393-1-gael.portay@savoirfairelinux.com>
Message-ID: <20170703084733.2278a5b2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  1 Apr 2017 18:36:51 -0400, Ga?l PORTAY wrote:
> This patch adds the Qt virtualkeyboard package.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> Reviewed-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes since v6:
>  - Add missing empty lines in Config.in.
>  - Reword note for all flag in help message.
>  - Remove mention of GPLv3 license in help message.
>  - Use filter text-function instead of strip+findstring to flag/install
>    3rd-parties.
>  - Fix useless call to strip when installing 3rd-parties.

I've applied to master, after fixing the following things:

    [Thomas:
     - use SDPX license codes
     - add entry to DEVELOPERS file
     - drop BR2_PACKAGE_QT5BASE_LICENSE_APPROVED logic, since we removed this option
     - select BR2_PACKAGE_QT5DECLARATIVE and
       BR2_PACKAGE_QT5DECLARATIVE_QUICK instead of using a "depends on"
       and propagate the appropriate dependencies]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
