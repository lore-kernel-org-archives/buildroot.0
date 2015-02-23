From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Feb 2015 12:28:18 +0100
Subject: [Buildroot] [PATCH v2 next] package/freerdp: needs wchar
In-Reply-To: <1424672272-17853-1-git-send-email-fabio.porcedda@gmail.com>
References: <1424672272-17853-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150223122818.03f090ef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Mon, 23 Feb 2015 07:17:52 +0100, Fabio Porcedda wrote:
> Also add reverse dependency for Weston.
> 
> Fix build error:
> make[3]: Entering directory '/home/tetsuya/buildroot/br/output/build/freerdp-b21ff842ef3de5837513042dc30488b12bd9cf9d'
> In file included from /home/tetsuya/buildroot/br/output/build/freerdp-b21ff842ef3de5837513042dc30488b12bd9cf9d/winpr/include/winpr/winsock.h:24:0,
>                  from /home/tetsuya/buildroot/br/output/build/freerdp-b21ff842ef3de5837513042dc30488b12bd9cf9d/winpr/libwinpr/winsock/winsock.c:24:
> /home/tetsuya/buildroot/br/output/build/freerdp-b21ff842ef3de5837513042dc30488b12bd9cf9d/winpr/include/winpr/wtypes.h:132:1: error: unknown type name ?wchar_t?
>  typedef wchar_t UNICODE;
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
