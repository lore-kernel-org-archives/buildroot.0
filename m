From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 23:37:46 +0200
Subject: [Buildroot] [PATCH v2 2/2] mutt: Add options for imap/pop3
 support, enable optional iconv/OpenSSL support
In-Reply-To: <1397391257-12882-2-git-send-email-bernd.kuhls@t-online.de>
References: <1397391257-12882-1-git-send-email-bernd.kuhls@t-online.de>
 <1397391257-12882-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140414233746.26bba605@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 13 Apr 2014 14:14:17 +0200, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: - do not disable iconv support for toolchains with locale support (Thomas)
>     - optimize if-clause for OpenSSL support (Thomas)

Applied, thanks. However, I've kept a 'config BR2_PACKAGE_MUTT' and not
switched to a 'menuconfig BR2_PACKAGE_MUTT'. There are not enough
sub-options for now to warrant a menuconfig for mutt I believe.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
