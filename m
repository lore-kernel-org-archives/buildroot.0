From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Apr 2020 13:52:00 +0200
Subject: [Buildroot] [PATCH 1/2] support/scripts: add check-dotconfig.py
In-Reply-To: <20200420091757.2931721-1-romain.naour@gmail.com>
References: <20200420091757.2931721-1-romain.naour@gmail.com>
Message-ID: <20200420135200.0331bfc0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Apr 2020 11:17:56 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> For the same reason as for 50b747f212be2c9c0f7cf10c674ed488d042715c,
> we need to check if the generated configuration file (.config)
> contains all symbols present in the defconfig file.

Then can we also make the runtime-test infrastructure use this
check-dotconfig.py script ?

No need to do it right now, in this patch or patch series, but just
something that would be good to have.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
