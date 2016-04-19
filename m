From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 21:19:17 +0200
Subject: [Buildroot] [PATCH] connman: bump to version 1.32
In-Reply-To: <1461066318-27154-1-git-send-email-gustavo@zacarias.com.ar>
References: <1461066318-27154-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160419211917.03adcef3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Apr 2016 08:45:18 -0300, Gustavo Zacarias wrote:
> Drop upstream patches and add a new build fix (submitted upstream).
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../0001-configure-check-for-execinfo.h.patch      | 65 ----------------------
>  .../{0003-xtables.patch => 0001-xtables.patch}     |  0
>  ...ion-item-of-xtables-to-match-iptables-1.6.patch | 38 -------------
>  package/connman/0002-nat-build-failure.patch       | 30 ++++++++++
>  package/connman/connman.hash                       |  2 +-
>  package/connman/connman.mk                         |  2 +-
>  6 files changed, 32 insertions(+), 105 deletions(-)
>  delete mode 100644 package/connman/0001-configure-check-for-execinfo.h.patch
>  rename package/connman/{0003-xtables.patch => 0001-xtables.patch} (100%)
>  delete mode 100644 package/connman/0002-iptables-Add-missing-function-item-of-xtables-to-match-iptables-1.6.patch
>  create mode 100644 package/connman/0002-nat-build-failure.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
