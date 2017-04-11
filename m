From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 11 Apr 2017 20:09:11 -0300 (BRT)
Subject: [Buildroot] [PATCH v6 1/2] e2fsprogs: refactor to fix conflicts
 with busybox and util-linux
In-Reply-To: <d478a120-5823-895e-c211-fe7e5a4f3017@mind.be>
References: <3eeb7e24-fcc2-8d75-e0e8-141eeaceab70@mind.be>
 <1491824995-19670-1-git-send-email-casantos@datacom.ind.br>
 <2282fd1a-5a83-0b42-4417-3aedf252d28b@mind.be>
 <1676973985.18543033.1491929963459.JavaMail.zimbra@datacom.ind.br>
 <d478a120-5823-895e-c211-fe7e5a4f3017@mind.be>
Message-ID: <11759472.18619266.1491952151697.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Arnout Vandecappelle" <arnout@mind.be>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org, "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>, "Thomas Petazzoni"
> <thomas.petazzoni@free-electrons.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
> Sent: Tuesday, April 11, 2017 7:14:27 PM
> Subject: Re: [PATCH v6 1/2] e2fsprogs: refactor to fix conflicts with busybox and util-linux

> On 11-04-17 18:59, Carlos Santos wrote:
---8<---
>> I made a deep overhauling because the original recipe was so messy that
>> small changes did not work. It is now reasonable to artificially split the
>> change in seven patches now to end up with exactly the same result. It's
>> harder to implement, test and review, considering all possible options I
>> need to deal with:
> 
> I agree that it's a little bit harder to implement, but not to test and review.
> And it's pretty likely that you will not get the same result, because proper
> review will be done, problems will be discovered, and you end up with a
> different result :-)
> 
> If you don't split this up, don't expect the patch to be applied for the next
> year or so. The review burden is simply too high.

I see. That's really sad.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
