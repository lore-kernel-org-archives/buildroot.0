From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 11 Oct 2013 10:00:09 +0200
Subject: [Buildroot] [PATCHv3 19/20] package: package-based
 implementation of source, external-deps and legal-info
In-Reply-To: <20131010233303.783bfd6d@skate>
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-20-git-send-email-thomas.petazzoni@free-electrons.com>
 <5256E2BC.8020503@mind.be> <20131010233303.783bfd6d@skate>
Message-ID: <CAHkwnC__xBgx1jXWANgf-RHbBwX5i4A9szxqW4mOOoOkhL7Y6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 10, 2013 at 11:33 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Arnout,
>
> Thanks a lot for your review!
>
> On Thu, 10 Oct 2013 19:24:12 +0200, Arnout Vandecappelle wrote:
> [...]
>> > +PACKAGES_SOURCE:=$(patsubst %,%-all-source,$(PACKAGES) $(BASE_TARGETS))
>>
>>   BASE_TARGETS is just "toolchain", right? And that is already part of
>> the dependencies of PACKAGES, right? So why is that still needed here?
>
> Yes, BASE_TARGETS is just toolchain now. However no, "toolchain" is not
> yet part of the dependencies of all packages. This is something the
> patch series from Fabio Porcedda is doing, and I don't want to solve
> all problems in this patch set :)
>
> The main reason I've kept BASE_TARGETS for now is because I knew Fabio
> would be cleaning up that further with his patch set.

Sure, I will send a rebased patch set when this patch set is merged.

> [...]

Regards
-- 
Fabio Porcedda
