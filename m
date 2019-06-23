From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 22:20:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-golang: do not set static
 linking for host target
In-Reply-To: <20190610154007.28310-1-mirza.krak@northern.tech> (Mirza Krak's
 message of "Mon, 10 Jun 2019 17:40:07 +0200")
References: <20190610154007.28310-1-mirza.krak@northern.tech>
Message-ID: <87sgs0aw9k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mirza" == Mirza Krak <mirza.krak@northern.tech> writes:

 > The current logic will set the "-static" flag when building go
 > host packages if BR2_STATIC_LIBS is set, this will not work as
 > there is no support to link host packages statically.

 > Fix this by applying this logic only for target builds.

 > Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
 > ---

 > Fixes: http://autobuild.buildroot.net/results/f9b/f9ba64ab4c8d7fa6cb301fab37ee4141ba442f61/build-end.log

Committed to 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
