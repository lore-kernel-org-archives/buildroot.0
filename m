From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 22:15:25 +0200
Subject: [Buildroot] [V2] 4th: new package
In-Reply-To: <1467745520-4449-1-git-send-email-francois.perrad@gadz.org>
References: <1467745520-4449-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20160706221525.2bc4c7f8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Jul 2016 21:05:20 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/4th/0001-avoid-regen-during-install.patch | 17 ++++++
>  package/4th/4th.hash                              |  2 +
>  package/4th/4th.mk                                | 64 +++++++++++++++++++++++
>  package/4th/Config.in                             |  8 +++
>  package/Config.in                                 |  1 +
>  5 files changed, 92 insertions(+)
>  create mode 100644 package/4th/0001-avoid-regen-during-install.patch
>  create mode 100644 package/4th/4th.hash
>  create mode 100644 package/4th/4th.mk
>  create mode 100644 package/4th/Config.in

Applied to master, with the following changes:

    [Thomas:
     - fix the license information, it's GPLv3+, LGPLv3+.
     - add a comment about the COPYING file containing only the LGPLv3 text,
       even though there is some GPLv3+ code.
     - minor tweaks in the .mk file
     - rewrap Config.in help text.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
