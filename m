From: Anton Blanchard <anton@samba.org>
Date: Tue, 3 Dec 2013 22:28:46 +1100
Subject: [Buildroot] [PATCH] toolchain: Allow ld64.so linker
In-Reply-To: <20131203122107.66e5ba4e@skate>
References: <20131202172311.2641462e@kryten> <20131202110923.2ac86fb5@skate>
 <20131203221437.106b6bf5@kryten> <20131203122107.66e5ba4e@skate>
Message-ID: <20131203222846.35d6d9df@kryten>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Thomas,

> Perfect. Can you just resubmit just the patch (without this discussion
> above it), so that our patchwork picks up a good version of it, that
> the BR maintainer can apply?

Sure, I just resubmitted and it looks to have hit patchwork already.

> Also, just curious, are you actually using Buildroot for ppc64 or
> s390x machines?

Yes, we used buildroot to bootstrap ppc64le.

Anton
