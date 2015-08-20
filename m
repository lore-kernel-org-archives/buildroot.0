From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Aug 2015 23:59:00 +0200
Subject: [Buildroot] [PATCH] package/librtas: only show comment on
 supported architectures
In-Reply-To: <1440026414-32186-1-git-send-email-yann.morin.1998@free.fr>
References: <1440026414-32186-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150820235900.366d3a92@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 20 Aug 2015 01:20:14 +0200, Yann E. MORIN wrote:
> librtas is only available for PPC and PPC64, so only show the comment
> about the (e)glibc dependency for those archs.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Sam Bobroff <sam.bobroff@au1.ibm.com>
> ---
>  package/librtas/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
