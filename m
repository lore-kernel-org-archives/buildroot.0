From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 3 Mar 2017 23:50:54 +0100
Subject: [Buildroot] [PATCH] linux: Add CIP SLTS easy selection option
In-Reply-To: <20170303234636.0dbf4fd6@free-electrons.com>
References: <1488577816-19047-1-git-send-email-angelo.compagnucci@gmail.com>
 <20170303234636.0dbf4fd6@free-electrons.com>
Message-ID: <7663394e-1ac6-07ae-a226-159605ac4011@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-03-17 23:46, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri,  3 Mar 2017 22:50:16 +0100, Angelo Compagnucci wrote:
>> This patch adds an easy way to select the CIP project SLTS
>> kernel within the kernel menu.
>>
>> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> 
> I personally don't think we should have explicit support for kernels
> other than the vanilla Linux kernel. Our kernel options already allow
> to select any arbitrary tarball or Git repository, which makes it
> possible to use this linux-cip Git repository as your kernel source if
> you like it.
> 
> Supporting explicitly additional kernel trees is a never-ending story.
> Everyone will want its own kernel tree listed in Buildroot.
> 
> And this linux-cip thing is in fact probably a lot less popular than
> other non-vanilla kernel trees (like the one for RaspberryPi, for
> BeagleoBone, the PREEMPT_RT tree, etc.).

 In addition, I have yet to meet an actual embedded system product that uses an
unpatched kernel. In practice, the CIP kernel is going to be the _base_ of a
product, and not used directly.

 That said, it would be useful to add a defconfig that makes use of that kernel.
I guess they must have some kind of flagship board to run on, no?

 Regards,
 Arnout

> 
> So I apologize, but I'm personally not in favor of this patch.
> 
> Best regards,
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
