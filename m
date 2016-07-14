From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Jul 2016 12:54:19 +0200
Subject: [Buildroot] [PATCH] gnutls: security bump to version 3.4.14
In-Reply-To: <1468414617-12700-1-git-send-email-gustavo@zacarias.com.ar>
References: <1468414617-12700-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160714125419.46cd7d99@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Jul 2016 09:56:57 -0300, Gustavo Zacarias wrote:
> Fixes:
> GNUTLS-SA-2016-2 - vulnerability that affects certificate verification
> when GnuTLS is used in combination with the p11-kit trust module.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gnutls/gnutls.hash | 2 +-
>  package/gnutls/gnutls.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
