From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 23:10:26 +0100
Subject: [Buildroot] [PATCH 2/2] openntpd: add check for LibreSSL.
In-Reply-To: <20171108130459.25412-2-aduskett@gmail.com>
References: <20171108130459.25412-1-aduskett@gmail.com>
 <20171108130459.25412-2-aduskett@gmail.com>
Message-ID: <20171122231026.1cfdddf5@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Nov 2017 08:04:59 -0500, Adam Duskett wrote:

> +	  Note: Cryto support is only available with the LibreSSL ssl

Cryto -> Crypto.

> +	  library.
> +
>  	  http://www.openntpd.org/

I've reworded a bit the Config.in help text and applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
