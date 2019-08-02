From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Aug 2019 22:52:46 +0200
Subject: [Buildroot] [PATCH 2/6] package/gcc: remove libmudflap option
In-Reply-To: <20190802130937.12591-2-romain.naour@smile.fr> (Romain Naour's
 message of "Fri, 2 Aug 2019 15:09:32 +0200")
References: <20190802130937.12591-1-romain.naour@smile.fr>
 <20190802130937.12591-2-romain.naour@smile.fr>
Message-ID: <87ftmjqogx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > libmudflap was removed from gcc 4.9 [1] so it depends on gcc <= 4.9.
 > This option can't be selected since we removed gcc 4.8 from Buildroot
 > [2].

 > [1] 4a692aefee10088c385d30e829abf80af1616d1b
 > [2] f66952197b41452b77dfa065adc7172137e4c243

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
