From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Nov 2013 14:20:06 +0100
Subject: [Buildroot] [PATCHv2 0/4] Add a BR2_EXTERNAL mechanism
In-Reply-To: <20131124202025.GB3575@free.fr>
References: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20131124202025.GB3575@free.fr>
Message-ID: <20131126142006.64b5528c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 24 Nov 2013 21:20:25 +0100, Yann E. MORIN wrote:

> On 2013-09-14 21:03 +0200, Thomas Petazzoni spake thusly:
> > Here is the second version of the BR2_EXTERNAL patch series.
> 
> I was wondering what the plan with BR2_EXTERNAL was, in the end?
> 
> From my recollection of the last DevDay, I understood we would go with
> it, with a few changes:
>   - add a generated, sub-makefile in $(O) with the definition of
>     BR2_EXTERNAL, so that it is not needed to repeat it on the command
>     line of future invocations of 'make'
>   - enforce the same directory layout, package/ board/ and configs/
> 
> Right?
> 
> If so, Thomas, since your the original submitter: do you have pending
> changes to that effect, or are you waiting for someone to kick in and
> continue the work on this patch series?

I don't have pending changes right now. But since Ryan is in Toulouse
this week (and we've been doing some Buildroot hacking together), I
think we'll try to spend one evening on the BR2_EXTERNAL stuff and come
up with an updated proposal that takes into account the ELCE
discussions.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
