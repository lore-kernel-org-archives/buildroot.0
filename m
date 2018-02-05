From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Mon, 5 Feb 2018 14:11:48 +0100
Subject: [Buildroot] [PATCH v10 08/10] cargo: new package
In-Reply-To: <87eflzwx49.fsf@dell.be.48ers.dk>
References: <20180204180749.29942-1-eric.le.bihan.dev@free.fr>
 <20180204180749.29942-9-eric.le.bihan.dev@free.fr>
 <87eflzwx49.fsf@dell.be.48ers.dk>
Message-ID: <CAH=K+6kbLM-cf4NAqj=V8Ry_uOtjfWUV558kSyksLwPu=VSK3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, Peter,

On Mon, Feb 5, 2018 at 11:26 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:
>
[snip]

>  > +CARGO_DEPS_SHA512 = 60c12ce49a53cf986490f5a5fdf606f0374677902edfdc4d48ab1ba6094f3f23efc59626cd3776649c9386a9cab2a60332e5693aad6acbcbb92132efdcf9fe21
>  > +CARGO_DEPS_SITE = http://pkgs.fedoraproject.org/repo/pkgs/cargo/$(CARGO_DEPS_SOURCE)/sha512/$(CARGO_DEPS_SHA512)
>
> Is that the official location for this?
>
> pkgs.fedoraproject.org is failing for me at the moment :/

I hopped into #fedora-admin and was told that pkgs was deprecated last
year, and due to some DoS mitigation was taken offline last week (I
didn't press if it was permanent).

In either case, it seems like this should using src.fedoraproject.org
as that is the permanent solution given to me.

Thanks,

Sam Voss
