From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 07 May 2020 23:11:19 +0200
Subject: [Buildroot] [PATCHv2 05/12]
 configs:minnowboard_max-graphical_defconfig: re-enable GLX support
In-Reply-To: <20200421172646.3340666-5-romain.naour@gmail.com> (Romain Naour's
 message of "Tue, 21 Apr 2020 19:26:39 +0200")
References: <20200421172646.3340666-1-romain.naour@gmail.com>
 <20200421172646.3340666-5-romain.naour@gmail.com>
Message-ID: <87y2q3tpqg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > This defconfig loses mesa3d-demo and glmark2 package since commit
 > 5cb821d5635626b7327d5d704555c412e5ed5a1f that introduced an
 > explicit option to enable GLX support.

 > This fixes the new defconfig check.

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > ---
 > This patch should be backported to 2020.02.x and 2019.11.x.

2019.11.x is EOL, but committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
