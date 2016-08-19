From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 14:42:54 +0200
Subject: [Buildroot] [PATCH v2 1/3] tinycbor: bump to version 0.3.2
In-Reply-To: <1471609176-3397-1-git-send-email-fabrice.fontaine@orange.com>
References: <1471609176-3397-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20160819144254.2da7208c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Aug 2016 14:19:34 +0200, Fabrice Fontaine wrote:
> tinycbor 0.3.2 includes the buildroot patch that fixes the installation
> with old Makefile used by targets such as blackfin, more details can be
> found here: https://patchwork.ozlabs.org/patch/652187
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> ---
> Changes v1 -> v2 (after review of Peter Korsgaard):
>  - Update commit message

Thanks, I've applied the three patches, with those additional tweaks in
the commit log of the last patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
