From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 09:25:42 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/uclibc: bump version to
 1.0.35
In-Reply-To: <20200903155728.19448-1-petr.vorel@gmail.com>
References: <20200903155728.19448-1-petr.vorel@gmail.com>
Message-ID: <20200907092542.4d7aba86@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  3 Sep 2020 17:57:27 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> Drop patch from this release.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

This is causing some build breakage:

  http://autobuild.buildroot.net/results/938729c42d52bd9e74454bc34b2b20c4e0503142/build-end.log

  http://autobuild.buildroot.net/results/bc50834820c921ce4927f23e4dcfa2aaa405c657/build-end.log

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
