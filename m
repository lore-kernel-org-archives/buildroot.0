From: Poole, Donald R. <drpoole@swri.org>
Date: Wed, 15 Feb 2012 15:22:23 +0000
Subject: [Buildroot] Buildroot RFS Login Question
In-Reply-To: <878vkb4s8h.fsf@macbook.be.48ers.dk>
Message-ID: <CB612930.303D%donald.poole@swri.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2/9/12 3:22 PM, "Peter Korsgaard" <jacmet@uclibc.org> wrote:


>>>>>> "Donald" == Poole, Donald R <drpoole@swri.org> writes:
>
>Hi,
>
> Donald> So, I see it in the fakroot invocation and when I issue the
>command you
> Donald> gave to check the permissions of the busybox binary, it get this
>output:
>
> Donald> 	-rwsr-xr-x root/root    621852 2012-02-09 13:43 ./bin/busybox
>
> Donald> So, it appears that it's being set correctly too.
>
>All good. So where does it get stripped from here on until you execute
>it on the target?
>
>-- 
>Bye, Peter Korsgaard

I've been trying to see where its getting stripped from, but every time I
build a new tarball and extract it to a new filesystem, it just works.
Unless I figure out what happened, I guess my problem is solved.  Thanks a
lot for your patience and assistance with this issue.

Thanks,
Donald R. Poole, Jr.
Research Engineer
Voice: 210.522.3131 | Fax: 210.522.4931
Tactical Networks & Communications (tacticalnetworks.swri.org)
Southwest Research Institute (SwRI)
