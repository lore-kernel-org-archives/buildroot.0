From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Oct 2019 00:13:17 +0200
Subject: [Buildroot] [PATCH] package/libkrb5: Bumb to 1.17
In-Reply-To: <20190930202813.GA10860@scaer>
References: <20190930113931.9654-1-nerv@dawncrow.de>
 <20190930221815.6d06ffcb@windsurf.home> <20190930202813.GA10860@scaer>
Message-ID: <951ab4ba-69ba-bd1c-d324-f110f8dd94ac@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/09/2019 22:28, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2019-09-30 22:18 +0200, Thomas Petazzoni spake thusly:
>> On Mon, 30 Sep 2019 13:39:31 +0200
>> Andr? Hentschel <nerv@dawncrow.de> wrote:
>>> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> [--SNIP--]
>> However, I think this package license information may not be totally
>> correct, independently of this version bump. Indeed, our libkrb5.mk
>> says the license is MIT, but the NOTICE file shows a bunch of parts
>> under BSD-2-Clause for example.
>>
>> Arnout, Yann, what do you think about this? It's one of those packages
>> with lots of code re-used from different projects, all under
>> MIT/BSD-2-Clause style licenses. I'd be interested to hear your opinion
>> on the matter.
> 
> Looking at the haorball the NOTICE file is, I would be tempted to just
> state:
>     LIBKRB5_LICENSE = Kerberos license
> 
> and be done with it. Let the user sort the mess on their side...

 IMO it's not *that* difficult to be complete. Licensecheck reports the
following (after pruning a bunch of irrelevant or wrong hits):

LIBKRB5_LICENSE = MIT, NTP, MIT-CMU, BSD-2-Clause, BSD-3-Clause, BSD-4-Clause, ISC


 BTW, for some reason licensecheck seems to identify MIT as "Expat licence"...

 Regards,
 Arnout
