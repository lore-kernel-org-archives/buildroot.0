From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 24 Apr 2017 07:40:08 -0500
Subject: [Buildroot] [PATCH 1/1] busybox: ncurses progs equiv as default
In-Reply-To: <c5cb0b01-856f-aaa6-eb45-5f6af1df8c3a@mind.be>
References: <1492654408-25342-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20170420040019.bjfwlwaknjvrj33c@tarshish>
 <CANQCQpZ_6yXNSgpNLGmGLmNwGRsQy84EUPkDoCBMhOTuh49Jsg@mail.gmail.com>
 <c5cb0b01-856f-aaa6-eb45-5f6af1df8c3a@mind.be>
Message-ID: <CANQCQpbrCc5UvMwGUY8iHmheUX-9B1_FZCnr5ye0mqT_d=BqmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sun, Apr 23, 2017 at 4:32 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 20-04-17 15:01, Matthew Weber wrote:
> > Baruch,
> >
> > On Wed, Apr 19, 2017 at 11:00 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> >> Hi Matt,
> >>
> >> On Wed, Apr 19, 2017 at 09:13:28PM -0500, Matt Weber wrote:
> >>> By default, enable the busybox equivalents of the ncurses
> >>> clear and reset if ncurses progs are not enabled.
> >>
> >> Our default busybox.config enables these applets. If the user chooses to
> >> disable them in a custom config, why should we force them back on?
> >>
> >
> > True, I was thinking the use case of build time changing (then doing
> > incremental build)if you use ncurses progs vs not and forcing the
> > busybox reconfig to have it update the target folder respectively.
>
>  This is a use case we certainly don't want to support. On the other hand, we
> *do* want to support the use case where the user has a custom busybox config,
> doesn't have ncurses, and doesn't want to have clear and reset in his system.

Thanks for the feedback, this was more of a RFC to tie-off my previous
patches. I'm good with it being rejected.
-Matt
