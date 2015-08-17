From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Aug 2015 22:34:18 +0200
Subject: [Buildroot] [PATCHv2] [autobuild] package/bwm-ng: fix build
 failures with gcc-5
In-Reply-To: <1439736791-28748-1-git-send-email-yann.morin.1998@free.fr>
References: <1439736791-28748-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150817223418.6f75a2e6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 16 Aug 2015 16:53:11 +0200, Yann E. MORIN wrote:

> diff --git a/package/bwm-ng/bwm-ng.hash b/package/bwm-ng/bwm-ng.hash
> index 6bb8355..85f436f 100644
> --- a/package/bwm-ng/bwm-ng.hash
> +++ b/package/bwm-ng/bwm-ng.hash
> @@ -1,2 +1,4 @@
> -# Locally calculated
> -sha256  c1134358e268329d438b0996399003b0f0b966034fb4b5b138761c2f3c62ffdd  bwm-ng-0.6.tar.gz
> +# From: http://sourceforge.net/projects/bwmng/files/bwmng/0.6/
> +# sha1  9445885d05e2430ca174739e3aba343afce94076  bwm-ng-0.6.1.tar.gz
> +# Because we do not trust SF.net, locally computed sha256:
> +sha256  027cf3c960cd96fc9ffacdf7713df62d0fc55eeef4a1388289f8a62ae5e50df0  bwm-ng-0.6.1.tar.gz

I think this is silly. We should use both the sha1 provided by
sourceforge and a locally calculated sha256 hash.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
