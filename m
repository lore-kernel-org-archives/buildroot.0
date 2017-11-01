From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 1 Nov 2017 14:33:51 +0100
Subject: [Buildroot] Libpng missing a link dependency in 2017-08?
In-Reply-To: <20171101102951.48ed6d91@windsurf>
References: <afc724e2-a455-82cd-80f8-ee329e2a3e47@ou.edu>
 <20171031214249.7db64df4@windsurf>
 <c5a035da-84c6-f07c-8f99-98b3a38456c9@gmail.com>
 <20171101102951.48ed6d91@windsurf>
Message-ID: <d884a668-8048-c634-b84b-4be8073ddfd6@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 01/11/2017 ? 10:29, Thomas Petazzoni a ?crit?:
> Hello,
> 
> Romain: thanks a lot for looking into this issue!

You're welcome.

> 
> On Tue, 31 Oct 2017 23:22:19 +0100, Romain Naour wrote:
> 
>> I don't know why this patch is not backported to 2.26 stable branch (and other
>> branch).
>>
>> Steve, can you ask on the glibc mailing list ?
> 
> Romain, since you're already on the glibc mailing list, and have
> already interacted with glibc developers, perhaps you could take care
> of this?

See: https://sourceware.org/ml/libc-alpha/2017-11/msg00018.html

> 
> In the mean time, we should backport this fix to our glibc 2.26+
> version, and possibly also to glibc 2.25 (used in 2017.08). Checking
> whether 2017.02 is affected as well would be useful.

I'll wait for upstream feedback before doing anything.

Best regards,
Romain

> 
> Thanks!
> 
> Thomas
> 
