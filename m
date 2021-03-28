From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Mar 2021 21:52:05 +0200
Subject: [Buildroot] [PATCH 0/5] legacy: drop old options (branch
 yem/drop-old-legacy)
In-Reply-To: <20210328212402.696e0207@windsurf.home>
References: <cover.1616878389.git.yann.morin.1998@free.fr>
 <20210328212402.696e0207@windsurf.home>
Message-ID: <20210328195205.GQ24043@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-03-28 21:24 +0200, Thomas Petazzoni spake thusly:
> On Sat, 27 Mar 2021 21:53:28 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > We advertise that legacy symbols will be removed after two years.
> > However, so far, we've be more lax than that, and we only dropped
> > symbols after about 5 year have elapsed.
> > 
> > This series removes options in step, starting with the usual 5-year
> > threshold, in 1-year increments, to eventually catch-up with the
> > advertised 2-year threshold.
> In fact, I am not sure I agree with the rule that we should keep them
> only 2 years. Indeed, for users that follow the LTS releases, 2 years
> should be more than enough. But believe it or not, our 12 months
> maintenance period is still considered too short by users who don't
> always have the resources/skills to update once a year. So we still do
> have users that upgrade quite infrequently.
> 
> Since the maintenance cost of those legacy options is essentially zero,
> I am wondering if we really need to drop them. Should we change the
> rule and drop the ones that are 5 years old for example ?

I noticed the two-year rule while adding the snippet, when I thought the
rule was five years, when it was only customs.

So, I split the series in steps, so that we could at least abide by the
established usage of dropping 5-year old entries, and then catch up to
the rule.

I am OK with making the rule '5 years', since that's what I thought it
was.

I'll resend an updated series.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
