From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Apr 2020 12:03:49 +0200
Subject: [Buildroot] [PATCH 4/4] package/openjdk: add support for
 building the full jdk
In-Reply-To: <20200417232922.3762195-4-aduskett@gmail.com>
References: <20200417232922.3762195-1-aduskett@gmail.com>
 <20200417232922.3762195-4-aduskett@gmail.com>
Message-ID: <20200418120349.1eaae283@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Apr 2020 16:29:22 -0700
aduskett at gmail.com wrote:

> Some users may require the full JDK on the target to debug or compile programs.

I don't think we should do that. Buildroot has always had a policy that
we don't support doing development on the target. That's why we don't
support installing gcc or g++ on the target.

So I think this policy should also apply to the JDK: we should support
*running* Java programs on the target, but not *building* Java programs
on the target.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
