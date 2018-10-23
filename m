From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 00:53:02 +0200
Subject: [Buildroot] [PATCH] poco: disable fpenvironment for soft
 floating point configuration
In-Reply-To: <20181010082214.1815-1-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Wed, 10 Oct 2018 10:22:14
 +0200")
References: <20181010082214.1815-1-yegorslists@googlemail.com>
Message-ID: <87in1sff75.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > Many platforms don't provide all FPU features needed by Poco when
 > configured for soft floating point in their fenv.h header. So
 > disable fpenvironment for this configuration to avoid build breakage.

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed to 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
