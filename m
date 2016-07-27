From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Jul 2016 11:23:04 +0200
Subject: [Buildroot] [PATCH] nettle: disable assembly optimizations for
	ARMv7M
In-Reply-To: <20160727101348.6861fa2e@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 27 Jul 2016 10:13:48 +0200")
References: <1469405759-3224-1-git-send-email-gustavo@zacarias.com.ar>
 <20160725224844.2ea67984@free-electrons.com>
 <87y44oyu6q.fsf@dell.be.48ers.dk>
 <20160727091544.3f40cf72@free-electrons.com>
 <87zip3y0ca.fsf@dell.be.48ers.dk>
 <20160727101348.6861fa2e@free-electrons.com>
Message-ID: <87vazrxwnb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > That's not what the commit message said. The commit message said:

 > """
 >     nettle: disable assembly optimizations for ARMv7M
    
 >     It's thumb2-only and it requires ARM instructions.
 > """

 > So it did not say at all that nettle requires Thumb-2 *and* classic. It
 > said that ARMv7M provides only thumb2, and that nettle requires ARM
 > instructions.

Ahh, I read "It" as referring to the nettle code, not ARMv7M cores.

-- 
Venlig hilsen,
Peter Korsgaard 
