From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Apr 2015 10:07:59 +0200
Subject: [Buildroot] [PATCH] libksba: security bump to version 1.3.3
In-Reply-To: <1428959876-32242-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428959876-32242-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150414100759.750b49de@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 13 Apr 2015 18:17:56 -0300, Gustavo Zacarias wrote:
> Fixes (no CVEs assigned yet):
> 
> * integer overflow in the DN decoder src/dn.c (append_quoted,
> append_atv)
> 
> * integer overflow in the BER decoder src/ber-decoder.c (ber_decoder_s)
> 
> * denial of service due to stack overflow in src/ber-decoder.c
> (push_decoder_state, pop_decoder_state)
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libksba/libksba.hash | 4 ++--
>  package/libksba/libksba.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
