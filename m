From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 10:46:32 +0100
Subject: [Buildroot] [PATCH] package/rtc-tools: new package
In-Reply-To: <20190115144901.GA28293@piout.net> (Alexandre Belloni's message
 of "Tue, 15 Jan 2019 15:49:01 +0100")
References: <20190115093229.8772-1-thomas.petazzoni@bootlin.com>
 <20190115144901.GA28293@piout.net>
Message-ID: <87ef9dexzb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexandre" == Alexandre Belloni <alexandre.belloni@bootlin.com> writes:

Hi,

 >> +RTC_TOOLS_VERSION = 33ef4aa1c92b0c92a351284d93d1ac5570de9cc7

 > Should I tag a release or are you fine with the git hash?

A release is always nicer, but just using the git hash is IMHO OK for
now.

If you are not planning any other changes in the near future, then I
would suggest you make a release.

-- 
Bye, Peter Korsgaard
