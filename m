From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 12:29:21 +0200
Subject: [Buildroot] [PATCH v2 1/1] shairplay-sync: new package
In-Reply-To: <1414191341-21557-1-git-send-email-jkrause@posteo.de>
References: <1414191341-21557-1-git-send-email-jkrause@posteo.de>
Message-ID: <20141025122921.0ad0652e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sat, 25 Oct 2014 00:55:41 +0200, J?rg Krause wrote:
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ---
> Changes v1 -> v2:
>   - autoselect SSL backend instead of a user choice
>   - autoselect zeroconf backend instead of a user choice
>   - fix missing select for optional package libsoxr
>   - fix config option for avahi (--with-avahi instead of --with-openssl)
>   - add comment to tinysvcmdns in shairport-sync.mk

Applied, after doing a few tweaks:

    [Thomas:
     - rework init script to be more like other Buildroot init scripts,
       and fix indentation.
     - fix indentation in the .mk file
     - remove dependencies on host-autoconf and host-libtool, since the
       package has AUTORECONF = YES, this is not needed.
     - fix licensing informations.]

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
