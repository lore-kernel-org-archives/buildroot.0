From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Nov 2015 22:53:29 +0100
Subject: [Buildroot] [PATCH 2/3] Config.in: add symbols for
 BR2_HOST_GCC_AT_LEAST_X_Y
In-Reply-To: <565B7102.2070707@mind.be>
References: <1448147919-5463-1-git-send-email-arnout@mind.be>
 <1448147919-5463-2-git-send-email-arnout@mind.be>
 <20151129174805.GC3630@free.fr> <565B665B.9050304@mind.be>
 <20151129211448.GK3630@free.fr> <565B7102.2070707@mind.be>
Message-ID: <20151129215329.GL3630@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-11-29 22:41 +0100, Arnout Vandecappelle spake thusly:
> On 29-11-15 22:14, Yann E. MORIN wrote:
> > On 2015-11-29 21:55 +0100, Arnout Vandecappelle spake thusly:
> >> On 29-11-15 18:48, Yann E. MORIN wrote:
[--SNIP--]
> >>> If you make each of those options actually select the N-1 option, then
> >>> all you need if to set one environment variable.
> >>  Alas, that is not possible with the env option. You'd need two symbols, one for
> >> getting it from the environment and a real one that can be selected.
> > That's not what I conclude from my experiments:
[--SNIP--]
>  OK, I just remembered something like that from experiments with LEGACY and
> didn't try again. I guess I remembered incorrectly :-)

What is sure is that those symbols are not saved in .config .

Not sure how legacy would have been impacted by the env option,
though...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
