From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 May 2012 10:15:25 +0200
Subject: [Buildroot] [PATCH 2/5] Added the libksba package.
In-Reply-To: <1336424385-8933-2-git-send-email-stijn.souffriau@essensium.com>
References: <1336424385-8933-1-git-send-email-stijn.souffriau@essensium.com>
 <1336424385-8933-2-git-send-email-stijn.souffriau@essensium.com>
Message-ID: <20120508101525.1ae7f45f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon,  7 May 2012 22:59:42 +0200,
Stijn Souffriau <stijn.souffriau@essensium.com> a ?crit :

> @@ -282,6 +282,7 @@ source "package/libnss/Config.in"
>  source "package/openssl/Config.in"
>  source "package/polarssl/Config.in"
>  source "package/libassuan/Config.in"
> +source "package/libksba/Config.in"

Entries should be ordered alphabetically.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
