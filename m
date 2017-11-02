From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 22:34:10 +0100
Subject: [Buildroot] [PATCH 4/4] package/ussp-push: removed
 deprecated/no longer needed deps on openobex-bluez
In-Reply-To: <20171101201137.29939-4-s.martin49@gmail.com>
References: <20171101201137.29939-1-s.martin49@gmail.com>
 <20171101201137.29939-4-s.martin49@gmail.com>
Message-ID: <20171102223410.1f144ef9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Nov 2017 21:11:37 +0100, Samuel Martin wrote:
> Commit 49a9fb0f13789298e65f21405502a9106e2c7382 deprecates the
> BR2_PACKAGE_OPENOBEX_BLUEZ option, which should be turned in
> BR2_PACKAGE_BLUEZ_UTILS instead.
> 
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Reported-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

I clearly don't see how this could be related to your patch, but we've
started to see ussp-push build failures:

  http://autobuild.buildroot.net/?reason=ussp-push-0.11

Could you have a look? :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
