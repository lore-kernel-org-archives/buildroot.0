From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Sep 2019 17:15:56 +0200
Subject: [Buildroot] [PATCH] package/openblas: fix jaguar openblas target
In-Reply-To: <20190817173749.2403-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 17 Aug 2019 19:37:49 +0200")
References: <20190817173749.2403-1-romain.naour@gmail.com>
Message-ID: <87sgpe3f0z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > In commit [1] Peter said he will use BOBCAT for
 > jaguar cpus. But JAGUAR was used instead.

 > Use BOBCAT as openblas target for JAGUAR cpus since
 > it is not listed in openblas's target list [2].

 > [1] 5e6fa93483caac317ab8844feb2ae9c07078a6c8
 > [2] https://github.com/xianyi/OpenBLAS/blob/release-0.3.0/TargetList.txt

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > ---
 > This patch can be backported to LTS version.

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
