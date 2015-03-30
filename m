From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 17:58:14 +0200
Subject: [Buildroot] [PATCH] gnutls: security bump to version 3.3.14
In-Reply-To: <1427714926-13582-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427714926-13582-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150330175814.7f82114d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 30 Mar 2015 08:28:46 -0300, Gustavo Zacarias wrote:
> Fixes a two-byte stack overflow in DTLS 0.9 protocol (no CVE assigned
> yet).
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gnutls/gnutls.hash | 2 +-
>  package/gnutls/gnutls.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
