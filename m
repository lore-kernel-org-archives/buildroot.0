From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 20:50:31 +0200
Subject: [Buildroot] [PATCH 2/2] linux: Disable
 -ftree-loop-distribute-patterns when building for microblaze with gcc >= 10
In-Reply-To: <bf99ed13-4c83-4500-7abf-fc301ae11e2e@mind.be>
References: <20200926191330.96074-1-romain.naour@gmail.com>
 <20200926191330.96074-2-romain.naour@gmail.com>
 <20200930225921.39dbe8a5@windsurf.home>
 <2efd6cda-edbf-bb5e-d7d7-89ca4491f0f0@gmail.com>
 <20201001100616.2cb75cc9@windsurf.home>
 <bf99ed13-4c83-4500-7abf-fc301ae11e2e@mind.be>
Message-ID: <20201006205031.6943fbd2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 6 Oct 2020 20:46:04 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>  If it's something needed to "fix the compiler", then it should be in the
> toolchain wrapper (i.e. TOOLCHAIN_WRAPPER_OPTS).

Right, good idea!

Romain, do you think you can revisit this using TOOLCHAIN_WRAPPER_OPTS ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
