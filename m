From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 17 Jun 2013 15:39:04 -0500
Subject: [Buildroot] Changes in the Buildroot autobuilders
In-Reply-To: <20130617175407.GA3202@free.fr>
References: <20130616180054.58f52914@skate> <20130616170305.GI3495@free.fr>
 <20130616191806.7b4a899a@skate> <20130616172508.GL3495@free.fr>
 <20130616200540.5a370504@skate> <20130617074535.GB16699@lukather>
 <20130617094958.33eaff88@skate>
 <CAEBucnCWYyj23_RyLtP3p-B6zmBYiYOA4LiODMEdxEr7x4D+xw@mail.gmail.com>
 <20130617175407.GA3202@free.fr>
Message-ID: <CAEBucnAh6r+QRAT9JccFOrzdwZpaRSJfDyg0mrwriWLk9+XPFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

> No, I am not in favour of this solution.
>
> Being a 'maintainer' should be voluntary, opt-in, and explicit.

I think many people would like to know if something they did may have
triggered a bug, not just the maintainer of the package.  I'm thinking
about this from the mindset of lets let people know they broke the
build.

> If I send an update or fix to a package does not mean I am committed to
> maintain that package in the long-run. This change can be just a typo or
> something minor, and might not express my interest in the wellfare of
> that package.
>
> However, if I am really interested in a package (eg. those I've
> submitted, or others that are important to me), then I want to express
> this intent to maintain it explicitly.
>
> Now, I understand that adding yet more to the .mk can be seen as clutter.
>
> The alternative to a expressing maintainership in the source would be to
> have the autobuilder website offer a way to subscribe/unsubscribe to
> certain conditions (eg. package, arch...). I think this is a bit
> overkill, and delicate to handle.

I agree this is overkill but if it's possible it would be the best solution.

Thanks,
Spenser

--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
