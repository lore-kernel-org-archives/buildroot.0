From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 21:27:07 +0100
Subject: [Buildroot] [PATCH] package/mpd: disable on SPARCV8, NIOS2,
	ARMV{4, 5}
In-Reply-To: <1485806156.3759.1.camel@embedded.rocks> (=?utf-8?Q?=22J?=
 =?utf-8?Q?=C3=B6rg?= Krause"'s message
 of "Mon, 30 Jan 2017 20:55:56 +0100")
References: <20170121161100.3142-1-joerg.krause@embedded.rocks>
 <20170122172600.333588cf@free-electrons.com>
 <1485080385.6667.1.camel@embedded.rocks>
 <20170130104952.409eb0d9@free-electrons.com>
 <1485806156.3759.1.camel@embedded.rocks>
Message-ID: <87vasw5m5g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

Hi,

 > OK.

 > I'm a little upset that there will be no MPD available for the ARMv5
 > architecture until GCC 7 is available?in Buildroot. Maybe we can still
 > support the 0.19 branch for the archs which are affected by the GCC
 > issue and use the 0.20 otherwise? Any objections?

Yeah, I agree that it isn't really very nice. What does upstream say?
Stick to 0.19 for now?

-- 
Bye, Peter Korsgaard
