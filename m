From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 18:59:32 +0100
Subject: [Buildroot] [PATCH] portaudio: fix dependency on alsa-lib
In-Reply-To: <1443981317-26663-1-git-send-email-luca@lucaceresoli.net>
References: <1443981317-26663-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20151004185932.250e961c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Sun,  4 Oct 2015 19:55:17 +0200, Luca Ceresoli wrote:
> BR2_PACKAGE_PORTAUDIO_ALSA is misspelled in one place, resulting in
> alsa-lib not being listed in the dependencies.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  package/portaudio/portaudio.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
