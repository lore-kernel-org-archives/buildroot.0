From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jan 2017 17:47:16 +1100
Subject: [Buildroot] [PATCH 1/1] package/eudev: fix build with gperf 3.1
In-Reply-To: <20170121200112.12593-1-bernd.kuhls@t-online.de>
References: <20170121200112.12593-1-bernd.kuhls@t-online.de>
Message-ID: <20170122174716.143b256b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 Jan 2017 21:01:12 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/1a0/1a0e76e2782a63e2b2fc2fc0d79471802afa4d35/
> 
> Tested on current buildroot master (eb6bb3411) with and without
> http://patchwork.ozlabs.org/patch/716134/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Since we have reverted the bump to gperf 3.1, I'm not sure it makes
sense to add a patch to fix an issue that doesn't exist.

An e-mail has been sent to the gperf maintainers to let them know that
version 3.1 breaks backward compatibility. We probably should wait for
their feedback before adding more stuff to Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
