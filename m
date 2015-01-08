From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jan 2015 21:13:42 +0100
Subject: [Buildroot] [PATCH] libiio: Drop requirement of threading
 support in the toolchain
In-Reply-To: <1420711071-12455-1-git-send-email-paul.cercueil@analog.com>
References: <1420711071-12455-1-git-send-email-paul.cercueil@analog.com>
Message-ID: <20150108211342.05994b3a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Paul Cercueil,

On Thu, 8 Jan 2015 10:57:51 +0100, Paul Cercueil wrote:
> The libiio library will compile fine with a toolchain that doesn't
> support threads (tested with br-arm-full-nothread.config).
> Only the IIOD program requires support for threading.
> 
> Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
> ---
>  package/libiio/Config.in | 4 ----
>  1 file changed, 4 deletions(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
