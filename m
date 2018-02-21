From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Feb 2018 22:47:49 +0100
Subject: [Buildroot] [PATCH] sunxi-mali-mainline-driver: set parallel
 build according to buildroot
In-Reply-To: <1519129328-98231-1-git-send-email-giulio.benetti@micronovasrl.com>
 (Giulio Benetti's message of "Tue, 20 Feb 2018 13:22:08 +0100")
References: <1519129328-98231-1-git-send-email-giulio.benetti@micronovasrl.com>
Message-ID: <87zi42hv5m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > sunxi-mali-mainline-driver builds using parallel compilation by default,
 > using -j $(nproc), but this could be not wanted.

 > Pass -j $(PARALLEL_JOBS) to build using jobs configured in buildroot.

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
