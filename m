From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 6 Jan 2009 16:22:17 -0200
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <87prj1v4dy.fsf@macbook.be.48ers.dk>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730901061022v3866b298y547235a57535d009@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Jan 5, 2009 at 7:18 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>
> I offer to do something about both: Take over maintainership and get
> atual stable releases out the door (if Erik and the other developers
> agree).

I for one welcome our new maintainer overlord.
Seriously, for what it's worth, you have my support.

> What is the plan? Getting the first release out is always the hardest,
> so I would on purpose aim low for the first release and get it out
> soon (February). The target is to get all architectures to build (and
> run where hw is available for test) using the default toolchain config
> and busybox, anything else is just a bonus.

AVR32 has been recently broken (again). I would much prefer that
changes were reverted (termporarily or not) and have AVR32 in this
"release" rather than deem it BROKEN.

> The big issue with buildroot quality control is the mindblowing number
> of configuration combinations and specialized hardware needed to
> test. I am therefore convinced we need to leverage qemu and
> agressively deprecate legacy versions / packages + actively work with
> upstream to keep the number of patches low. I think our users would
> also be happier with a less ambitious project that wouldn't break left
> and right, instead of the current situation.

Maybe we could get a buildbot going. Then we can let many of the
developers/uses here contribute cpu cycle to build tests.
The problem with qemu is that it will only cover some platforms that
it supports, and unfortunally for me, it doesn't support AVR32 :(

Kind Regards,
    Thiago A. Correa
