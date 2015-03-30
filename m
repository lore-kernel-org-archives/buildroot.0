From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 17:55:29 +0200
Subject: [Buildroot] [PATCH] libtasn1: security bump to version 4.4
In-Reply-To: <1427714833-13457-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427714833-13457-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150330175529.22b599f0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 30 Mar 2015 08:27:13 -0300, Gustavo Zacarias wrote:
> Corrects a two-byte stack overflow in asn1_der_decoding (no CVE
> assigned yet).
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libtasn1/libtasn1.hash | 2 +-
>  package/libtasn1/libtasn1.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
