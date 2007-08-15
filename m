From: Brad House <brad@mainstreetsoftworks.com>
Date: Wed, 15 Aug 2007 07:44:39 -0400
Subject: [Buildroot] [patch] mdnsresponder doesn't do parallel makes
In-Reply-To: <1187163750.4942.1.camel@elrond.sweden.atmel.com>
References: <46C21224.9020505@mainstreetsoftworks.com>
	<1187163750.4942.1.camel@elrond.sweden.atmel.com>
Message-ID: <46C2E727.2030408@mainstreetsoftworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> Apparently mdnsresponder will fail to build with parallel makes.
>> This patch just adds a -j1 to the $(MAKE) to force it to not
>> build in parallel.
>>
> 
> Buildroot defines $(MAKE1) for this purpose, but
> I will fix that, so no need to send a new patch.

Ah, I didn't realize that.  I just grepped through other
packages and saw some had -j1 flags for that purpose...

-Brad
