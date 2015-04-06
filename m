From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 23:43:03 +0200
Subject: [Buildroot] [PATCH v2] pulseview: new package
In-Reply-To: <1426759708-4920-1-git-send-email-bgolaszewski@baylibre.com>
References: <1426759708-4920-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <20150406234303.010225ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bartosz Golaszewski,

On Thu, 19 Mar 2015 11:08:28 +0100, Bartosz Golaszewski wrote:
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
> Version 2:
> - select BR2_PACKAGE_QT5BASE_PNG in Config.in - this is needed for
>   pulseview to properly display .png icons
> - don't select libserial port

This package is causing a number of build failures in our automated
testing system. Can you investigate them?

See: 

   http://autobuild.buildroot.org/?reason=pulseview-19be0af16af83ca10f7ce69cb64f0b0c6f6a0d81

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
