From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 24 Apr 2020 19:21:13 +0200
Subject: [Buildroot] glibc version choice ?
In-Reply-To: <20200405202300.GO22325@scaer>
References: <ec2476b1-3bb9-1ea4-fa63-6c5d4908a5d9@gmail.com>
 <20200405202300.GO22325@scaer>
Message-ID: <e4172d75-ac6c-fa75-a9ef-b06e56f06bf6@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

Le 05/04/2020 ? 22:23, Yann E. MORIN a ?crit?:
> Romain, All,
> 
> On 2020-04-05 17:56 +0200, Romain Naour spake thusly:
>> So what about reintroducing a version choice for glibc, at least a second choice
>> with the version N-1 ?
> 
> I am in favour of adding back a version choice for glibc, where we have
> a version that points to the a stable release branch, presumably N-1
> (but could be N-2 if N-1 is too unstable), which would be the default,
> and a version that points to the N branch.
> 
> Furthermore, I agree that we should not keep more than two versions.

Thanks for your reply.

For now, nobody else replied to the question.

I've sent the glibc version bump without re-introducing the version choice [1].
I'm ok to resend a v2 with it :)

[1]
http://patchwork.ozlabs.org/project/buildroot/patch/20200424164851.19897-2-romain.naour at smile.fr/

Best regards,
Romain


> 
> Regards,
> Yann E. MORIN.
> 
