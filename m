From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Dec 2013 13:16:01 +0100
Subject: [Buildroot] [PATCH] toolchain: Allow ld64.so linker
In-Reply-To: <20131203222846.35d6d9df@kryten>
References: <20131202172311.2641462e@kryten> <20131202110923.2ac86fb5@skate>
 <20131203221437.106b6bf5@kryten> <20131203122107.66e5ba4e@skate>
 <20131203222846.35d6d9df@kryten>
Message-ID: <20131203131601.1d95f2f4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anton Blanchard,

On Tue, 3 Dec 2013 22:28:46 +1100, Anton Blanchard wrote:

> > Perfect. Can you just resubmit just the patch (without this discussion
> > above it), so that our patchwork picks up a good version of it, that
> > the BR maintainer can apply?
> 
> Sure, I just resubmitted and it looks to have hit patchwork already.

Thanks!

> > Also, just curious, are you actually using Buildroot for ppc64 or
> > s390x machines?
> 
> Yes, we used buildroot to bootstrap ppc64le.

Cool. Will you submit other patches to enable ppc64/ppc64le ?

Another question: is it possible to mention under the umbrella of which
company this work has been done, in a public way? We're always looking
for some good success stories around Buildroot usage.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
