From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Nov 2015 21:15:07 +0100
Subject: [Buildroot] [PATCH] strongswan: security bump to version 5.3.4
In-Reply-To: <1447703706-28787-1-git-send-email-gustavo@zacarias.com.ar>
References: <1447703706-28787-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151116211507.4da13de5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 16 Nov 2015 16:55:06 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2015-8023 - authentication bypass vulnerability in the eap-mschapv2
> plugin that was caused by insufficient verification of the internal
> state when handling EAP-MSCHAPv2 Success messages received by the
> client.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/strongswan/strongswan.hash | 6 +++---
>  package/strongswan/strongswan.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
