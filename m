From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 21 Jul 2013 18:06:58 +0200
Subject: [Buildroot] [PATCHv2 2/3] eglibc/arm: doesn't build in thumb(1)
	mode
In-Reply-To: <20130721172415.1a730f0f@skate> (Thomas Petazzoni's message of
 "Sun, 21 Jul 2013 17:24:15 +0200")
References: <buildroot@busybox.net>
 <1374239193-23811-1-git-send-email-gustavo@zacarias.com.ar>
 <1374239193-23811-2-git-send-email-gustavo@zacarias.com.ar>
 <87li52td8g.fsf@dell.be.48ers.dk> <20130721172415.1a730f0f@skate>
Message-ID: <87hafnsxr1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> I know you didn't add this, but why are we forcing -O2 here? Thomas?

 Thomas> Because eglibc must be built with optimizations. See
 Thomas> http://patches.openembedded.org/patch/38849/ for example.

Ok, thanks. A small note about this would be good so it doesn't get
removed in future "cleanups".

-- 
Bye, Peter Korsgaard
