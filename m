From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Nov 2020 10:49:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/c-ares: fix install
In-Reply-To: <20201118074559.506401-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 18 Nov 2020 08:45:59 +0100")
References: <20201118074559.506401-1-fontaine.fabrice@gmail.com>
Message-ID: <87h7pnxadk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > c-ares 1.17.0 removed install of ares_dns.h which will result in build
 > failures with libeXosip and resiprocate

 > Fixes:
 >  - http://autobuild.buildroot.org/results/51573434303118fd92f32819e038971edee8bc28
 >  - http://autobuild.buildroot.org/results/cbf158f0c037d44ef293a8804d18c84e3b731059

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
