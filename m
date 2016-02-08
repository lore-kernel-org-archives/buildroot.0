From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Feb 2016 21:26:59 +0100
Subject: [Buildroot] [PATCH] polarssl: security bump to version 1.2.19
In-Reply-To: <1454959620-6274-1-git-send-email-gustavo@zacarias.com.ar>
References: <1454959620-6274-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160208212659.4800e230@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon,  8 Feb 2016 16:27:00 -0300, Gustavo Zacarias wrote:
> Fix bug in certificate validation that caused valid chains to be
> rejected when the first intermediate certificate has
> pathLenConstraint=0.
> 
> Removed potential leak in rsa_rsassa_pkcs1_v15_sign().
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/polarssl/polarssl.hash | 4 ++--
>  package/polarssl/polarssl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
