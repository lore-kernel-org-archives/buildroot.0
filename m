From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Apr 2020 14:38:23 +0200
Subject: [Buildroot] [PATCH 1/2] support/scripts: add check-dotconfig.py
In-Reply-To: <ec5face2-dba6-695a-81f4-1b4948261720@gmail.com>
References: <20200420091757.2931721-1-romain.naour@gmail.com>
 <20200420135200.0331bfc0@windsurf.home>
 <ec5face2-dba6-695a-81f4-1b4948261720@gmail.com>
Message-ID: <20200420143823.3883eaba@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 20 Apr 2020 14:19:55 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Not with the current implementation of the runtime-test infrastructure since the
> defconfig is bundled in the test python script.
> 
> The defconfig is written to .config but then we run make olddefconfig to
> generate the real .config. So we can't compare the .config file with
> check-dotconfig.py without creating a defconfig file.

Well, we can always have the defconfig written to a different file,
then copied to .config, that's not a big change to introduce.

> This can be easily be done in a followup patch.

Excellent, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
