From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 13:34:01 +0200
Subject: [Buildroot] [PATCH] uclibc: prevent rebuilding after
	installation to staging
In-Reply-To: <1402993642.5911.1.camel@abrodkin-8560l> (Alexey Brodkin's
 message of "Tue, 17 Jun 2014 08:27:22 +0000")
References: <1401913653-23804-1-git-send-email-abrodkin@synopsys.com>
 <1402416022.1656.2.camel@abrodkin-8560l.internal.synopsys.com>
 <87sinck1uj.fsf@dell.be.48ers.dk>
 <1402901025.3115.1.camel@abrodkin-8560l.internal.synopsys.com>
 <87ha3lcobo.fsf@dell.be.48ers.dk>
 <1402993642.5911.1.camel@abrodkin-8560l>
Message-ID: <87y4wu78pi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

Hi,

 >> > Please pardon me for this reminder but I'm wondering if you were able to
 >> > try this patch?
 >> 
 >> I'm really sorry, but real life got in the way. I'll test it now.

 > I'm wondering if you faced any issues during your testing, may I help
 > you somehow?

Sorry, I didn't got around to check it before now. Looks good, and I
have verified that it isn't needed for glibc and musl.

Committed, thanks.

-- 
Bye, Peter Korsgaard 
