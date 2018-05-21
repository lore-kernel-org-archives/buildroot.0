From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 May 2018 23:16:21 +0200
Subject: [Buildroot] [PATCH 6/8] ti-sgx-km: rename options to have
 proper prefix
In-Reply-To: <fb6a5c78-7556-4110-b52b-ea6cef274c88@mind.be> (Arnout
 Vandecappelle's message of "Wed, 16 May 2018 17:16:18 +0200")
References: <20180513190737.26079-1-thomas.petazzoni@bootlin.com>
 <20180513190737.26079-7-thomas.petazzoni@bootlin.com>
 <20180513193140.GJ22130@scaer>
 <e477cbd2-f662-b196-0c2c-f6959e42e983@mind.be>
 <20180516090052.21e0af47@windsurf>
 <fb6a5c78-7556-4110-b52b-ea6cef274c88@mind.be>
Message-ID: <87wovwiuai.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 16-05-18 09:00, Thomas Petazzoni wrote:
 >> Hello,
 >> 
 >> On Tue, 15 May 2018 23:52:33 +0200, Arnout Vandecappelle wrote:
 >> 
 >>>> What is nice with this solution, is that we have the new choice that is
 >>>> right near the legacy option so we can chek it, and it automatically
 >>>> gets the old setting.
 >>>> 
 >>>> But I am not too convinced, however, because we do not usually use the
 >>>> name of a choice elsewhere...  
 >>> 
 >>> Legacy is pretty special anyway. I do think it's worthwhile it to do this properly.
 >> 
 >> Is this an Acked-by to the approach this patch series has taken in
 >> terms of handling the Config.in choice option renaming ?

 >  Er, no, it's a NACK. I *do* think it's worthwhile to properly select the new
 > option.

OK. I would like to release RC2 and include these renames, so how about
you send a followup series with the reworked Config.in.legacy handling?

Thanks.

-- 
Bye, Peter Korsgaard
