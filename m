From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 22:24:34 +0100
Subject: [Buildroot] [PATCH 1/1] php-fpm: remove config comments to fix
 startup
In-Reply-To: <1478634582-15683-1-git-send-email-fhunleth@troodon-software.com>
References: <1478634582-15683-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20161109222434.76588a57@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  8 Nov 2016 14:49:42 -0500, Frank Hunleth wrote:
> The comments in the Buildroot-provided php-fpm.conf would produce the
> following error when starting php-fpm:
> 
> ERROR: [/etc/php-fpm.conf:2] value is NULL for a ZEND_INI_PARSER_ENTRY
> 
> Removing the comments fixes the problem.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  package/php/php-fpm.conf | 3 ---
>  1 file changed, 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
