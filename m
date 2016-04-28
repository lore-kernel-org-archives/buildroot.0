From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Apr 2016 14:10:23 +0200
Subject: [Buildroot] [PATCH v2 4/8] php: bump version to 7.0.5
In-Reply-To: <1460980391-65336-5-git-send-email-Vincent.Riera@imgtec.com>
References: <1460980391-65336-1-git-send-email-Vincent.Riera@imgtec.com>
 <1460980391-65336-5-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160428141023.72a8e7c9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Apr 2016 12:53:07 +0100, Vicente Olivert Riera wrote:

> -PHP_VERSION = 5.6.20
> +PHP_VERSION = 7.0.5

I haven't looked at the details, but about PHP 7,
https://en.wikipedia.org/wiki/PHP says:

""Several unmaintained or deprecated server application programming
interfaces (SAPIs) and extensions were removed from the PHP core, most
notably the legacy mysql extension""

But there is still an option for MySQL in package/php/Config.ext.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
