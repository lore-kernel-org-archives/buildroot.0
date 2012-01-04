From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Jan 2012 09:21:18 +0100
Subject: [Buildroot] [PATCH 03/14] Improve external toolchain logic to
 support IA32 Sourcery CodeBench toolchain
In-Reply-To: <CAAXf6LU45gLO5doMUr9jmAYJ9JUVH5p3vH1tg8Y-Hzb2-uQxQw@mail.gmail.com>
References: <cover.1325622133.git.thomas.petazzoni@free-electrons.com>
 <1131294419984a7497639c225f830a8fd34e0529.1325622133.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LU45gLO5doMUr9jmAYJ9JUVH5p3vH1tg8Y-Hzb2-uQxQw@mail.gmail.com>
Message-ID: <20120104092118.320f989f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 4 Jan 2012 08:48:37 +0100,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> Is it intentional that you removed $(Q) here?

No (in both locations). Thanks for noticing, I'll fix it.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
