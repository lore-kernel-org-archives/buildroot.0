From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 8 Feb 2015 16:10:35 +0100
Subject: [Buildroot] [PATCH] glibc: bump version to 2.21
In-Reply-To: <20150208144048.GD4028@free.fr>
References: <1423333238-47401-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150208101809.GA4028@free.fr> <54D7713B.1040402@imgtec.com>
 <20150208144048.GD4028@free.fr>
Message-ID: <54D77C6B.3060106@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

thank you very much for your comments. I have sent a new patch series
and set the former patch as "changes requested".

Regards,
--
Vincent

On 08/02/15 15:40, Yann E. MORIN wrote:
> Vicente, All,
> 
> On 2015-02-08 15:22 +0100, Vicente Olivert Riera spake thusly:
>> when glibc-2.20 was added, it was done in the same way: adding 2.20,
>> removing 2.18 and setting 2.19 as default. All in the same patch, and
>> nobody complained. See:
>>
>> http://git.buildroot.net/buildroot/commit/?id=f660cfd043b898c9b9eb5fc5ccc90335d6b334f5
>>
>> Why should I do it in separate patches now?
> 
> Hehe. :-)
> 
> Well, the fact that a previous commit is not correct does not mean we
> can continue to commit incorrect changes.
> 
> Q. Why do I suggest we do it in separate patches?
> 
> A. Because they are *semantically* different changes. Doing semantically
>    unrelated changes means:
>     1) they are easier to review (granted, your patch is pretty simple),
>     2) each can be easily reverted in case we discover an issue later on,
>        without reverting the full change.
> 
> Q. Why are those *semantically* separate changes?
> 
> A. Because each is doing different things:
>     1) it is adding a new version,
>     2) it is changing a default,
>     3) it is removing a version.
> 
> A review if also to give one's opinion about how things should be done.
> Different people may see "The Way" differently. ;-)
> 
> That's why I said I would _prefer_ they be done in separate changes. Of
> course, others may disagree, and the maintainer will have the final say
> (i.e. accept your patch as-is if it suits him, or ask for it to be
> split).
> 
> Regards,
> Yann E. MORIN.
> 
