From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 16:23:15 +0200
Subject: [Buildroot] [PATCH] wine: fix alsa-related build error
In-Reply-To: <1430487628-9667-1-git-send-email-gustavo@zacarias.com.ar>
References: <1430487628-9667-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150501162315.79241c34@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri,  1 May 2015 10:40:28 -0300, Gustavo Zacarias wrote:
> The fix from 81230a5b3a27e315f0ba1334d7ab257812b7ab69 is incomplete.
> BR2_PACKAGE_ALSA_LIB_RAWMIDI is required as well. Fixes:
> http://autobuild.buildroot.org/results/018/018391c5e70d33bc0b5745ad7a2a273efa9be0d7/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/wine/wine.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
