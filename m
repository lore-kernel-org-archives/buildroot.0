From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 22 Apr 2014 19:49:26 +0200
Subject: [Buildroot] [PATCH 5/6] temporary hack to fix linking error
In-Reply-To: <53553361.80008@zacarias.com.ar>
References: <1397382423-4939-1-git-send-email-wbx@openadk.org>
 <1397382423-4939-6-git-send-email-wbx@openadk.org>
 <53553361.80008@zacarias.com.ar>
Message-ID: <20140422174926.GE14063@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,
Gustavo Zacarias wrote,

> On 04/13/2014 06:47 AM, Waldemar Brodkorb wrote:
> 
> > See here for more info:
> > https://sourceware.org/ml/libc-help/2014-04/msg00020.html
> > 
> > Still working on the issue.
> 
> This patch works, but by it being temporary/hacky it should be
> conditionally applied just for microblaze since you probably have no
> idea how it can affect other architectures.
> 
> By the way, how is it that we're not interested in fixing things or
> something like that?
> (https://sourceware.org/ml/libc-help/2014-04/msg00027.html)
> I'm using my (volunteer/spare) time looking at your patchset and testing
> it, so i think that's not a fair assessment, and disabling eglibc
> because "no time to test" and saying that at the same time sounds pretty
> much like double-standards.
> I'm not saying this to get you angry or anything like that, it's just
> that you're stating it in a very public mailing list and it seems
> utterly unfair to many BR contributors. Many people do what they can
> when they can.

Okay, sorry. I thought that there is no interest in my patches,
because I got no feedback at all. Looking at the traffic on the
mailinglist nearly every patch set gets some feedback after 2-3
days. My bug report about the microblaze OOM got no feedback, too. 
I stop whining now, and start hacking.
 
> Now with that out of the way, care to respin this patch with the
> consideration i mentioned above?

I will respin the patches after your gcc 4.9 patch set gets
committed. I tested with gcc 4.9 and the workaround for glibc/eglibc
is not required anymore.

best regards
        Waldemar 
