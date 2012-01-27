From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Fri, 27 Jan 2012 16:32:02 +0100
Subject: [Buildroot] Buildroot Developer Day, Friday 3rd February,
	Brussels
In-Reply-To: <20120127162722.7c227e2f@skate>
References: <20120124000812.6d043023@skate>
 <CAAXf6LW6aCs-G_FD=pXNGsBrV3133donzNxsuNV_7O=9JMCs4Q@mail.gmail.com>
 <201201271133.20517.arnout@mind.be> <20120127125805.580febd8@skate>
 <87sjj1jhhw.fsf@macbook.be.48ers.dk> <20120127162722.7c227e2f@skate>
Message-ID: <4F22C372.20908@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 27.01.2012 16:27, schrieb Thomas Petazzoni:
> Le Fri, 27 Jan 2012 16:24:27 +0100,
> Peter Korsgaard <jacmet@uclibc.org> a ?crit :
> 
>> Completely FIFO is not an option with the current backlog as updates
>> are sometimes sent and the latest version should be used, but I agree
>> - The situation is not optimal.
> 
> Yeah, of course full FIFO will not work. I just wanted to point out
> some of the patch sets that have been sitting around for a while. But
> agreed, the most recent patches are the one that have the highest
> chance of applying properly, so it's definitely easier to handle them.

That's where such tools as gerrit and build server come in play, cause they perform automatic integration build and let you know if patch is broken or breaks something.

Best regards,
Yegor
