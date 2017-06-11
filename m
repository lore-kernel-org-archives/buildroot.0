From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 15:23:40 +0200
Subject: [Buildroot] [PATCH 2/2] package lcdproc: override libpng-config
 path
In-Reply-To: <20170611131317.16345-2-romain.naour@gmail.com>
References: <20170611131317.16345-1-romain.naour@gmail.com>
 <20170611131317.16345-2-romain.naour@gmail.com>
Message-ID: <20170611152340.3e9f9298@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Jun 2017 15:13:17 +0200, Romain Naour wrote:
> Like for freetype-config, override libpng-config path otherwise
> the one from the host system may be used when installed.
> Make sure that the one from HOST_DIR is used.

You wanted to say STAGING_DIR here, right?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
