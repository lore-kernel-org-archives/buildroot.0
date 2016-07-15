From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 20:36:55 +0200
Subject: [Buildroot] [PATCH 05/12 v8] package/eudev: libgudev is no
 longer provided by eudev
In-Reply-To: <a29ab343be244bbe3a7d1b12c63486ea7f64784d.1468274498.git.yann.morin.1998@free.fr>
References: <cover.1468274498.git.yann.morin.1998@free.fr>
 <a29ab343be244bbe3a7d1b12c63486ea7f64784d.1468274498.git.yann.morin.1998@free.fr>
Message-ID: <20160715203655.5f1cc4fa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Jul 2016 00:16:28 +0200, Yann E. MORIN wrote:
> libgudev is now provided by the the eponym package libgudev.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/eudev/eudev.mk | 7 -------
>  1 file changed, 7 deletions(-)

Applied to master, thanks. I've also made an additional commit to
libgudev Config.in file, to update a comment that was saying that
libgudev was provided by eudev (which was no longer the case since
eudev 3.1.3).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
