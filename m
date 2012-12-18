From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Dec 2012 09:48:35 +0100
Subject: [Buildroot] [PATCH] sg3-utils new package.
In-Reply-To: <1355776546-25189-1-git-send-email-marek.belisko@open-nandra.com>
References: <1355776546-25189-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <20121218094835.688afe2c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marek Belisko,

On Mon, 17 Dec 2012 21:35:46 +0100, Marek Belisko wrote:

> +SG3_UTILS_INSTALL_STAGING = YES

Hum, why is this needed? Does sg3_utils installs some libraries or
headers that are useful for other packages?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
