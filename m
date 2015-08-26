From: Brendan Heading <brendanheading@gmail.com>
Date: Wed, 26 Aug 2015 18:44:28 +0100
Subject: [Buildroot] [PATCH v2 1/1] packages/linux-pam: disable when
	using musl
In-Reply-To: <20150826192628.777d6b52@free-electrons.com>
References: <1440109933-6123-1-git-send-email-brendanheading@gmail.com>
 <20150826152842.1fb22ddd@free-electrons.com>
 <CA+BsyQ4GEO6rT2-exVvJondiMtbP1_5hasdL5fHSEuZGH4z4dg@mail.gmail.com>
 <20150826192628.777d6b52@free-electrons.com>
Message-ID: <CA+BsyQ6RWY97u1W2iX1aoSXO4mm6XjZj6iz4WV6WttS=rKfQ-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Is upstream interested about musl support, and active?
>
> The thing that worries me a bit about the changes required to get
> things (in general, not only linux-pam) is that many of those patches
> will probably never make their way to the respective upstream
> projects.

Good question.

I'd sent the patch here first as folks here are generally more clued
up on cross compiling, differing C libraries, autoconf/automake and so
on.

But I can certainly go ahead and raise it with the upstream maintainers.

Brendan
