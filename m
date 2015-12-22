From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 11:16:21 +0100
Subject: [Buildroot] [PATCH] Makefile: Add RANLIB to the list of
 critical variables to unexport
In-Reply-To: <1447787044-4597-1-git-send-email-trini@konsulko.com>
References: <1447787044-4597-1-git-send-email-trini@konsulko.com>
Message-ID: <20151222111621.2a2b2f00@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tom,

On Tue, 17 Nov 2015 14:04:04 -0500, Tom Rini wrote:
> If RANLIB is set and we're trying to build binutils, binutils will pick
> this up and potentially fail to build.
> 
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
>  Makefile |    1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
