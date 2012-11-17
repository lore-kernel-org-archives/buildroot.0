From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Nov 2012 11:12:52 +0100
Subject: [Buildroot] [PATCH] libffi: Needs threads support in toolchain
In-Reply-To: <1353140814-26164-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1353140814-26164-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <20121117111252.7fe4e9d1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Ripard,

On Sat, 17 Nov 2012 09:26:54 +0100, Maxime Ripard wrote:
> Fixes
> http://autobuild.buildroot.org/results/7ee57d01917ea72d1811469e482513dda2ceb1ea/build-end.log
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

As Peter said, your patch cannot work, as we have to fix all the
reverse dependencies. I'll try to cook a patch that removes the libffi
dependency on threads when threads are not available.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
