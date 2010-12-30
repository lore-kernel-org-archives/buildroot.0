From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 30 Dec 2010 19:18:42 +0100
Subject: [Buildroot] commiting patches
In-Reply-To: <20101230063005.15755osot9w5qwco@www.home.zuerker.org>
References: <20101230063005.15755osot9w5qwco@www.home.zuerker.org>
Message-ID: <201012301918.42811.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On Thursday 30 December 2010 13:30:05 Heiko Zuerker wrote:
> I was wondering for a while, what are the criterias for patches to be  
> applied to buildroot.
> Some of them seem to get applied right away, others were sent in a  
> month or two ago and don't. I understand that some probably will never  
> get applied, but will there be a "sorry dude, but..." email?
> Just curious how this is handled.

Well, I won't speak for Peter, or any other participant, but here's what
I believe is the proper way to act:

0) prefer sending:
   - new features asap after a release
   - bug fixes: always
   - in a patch series, bug fixes come first, features come last
     - that way, even if your new feature has issues, or is not
       interesting, at least your bug fixes can be applied
   - in a patch series, trivial changes go first, and more complex
     ones go to the end, as much as possible, so that you get a bit
     more chance to get part of the series applied
   - once a series as been partiually applied (cause of bug fixes
     or new feature), you get a better chance that the remaining in
     the next iteration gets more attention
   - MOST IMPORTANT: do not expect people to be too much reactive
     during holidays season, such as X-Mas, when people tend to be
     with their families, and might not have that much time to
     dedicate to FLOSS projects. ;-)
   - look at who is usually changing the files you touch, and CC them
     as that will make them notice. Do not CC too many people, or
     everyone might think the series will be handled by someone esle
     (max 2 CC is good fo BR, I believe)

1) send your patch series:
   - properly document each patch
   - have an explicit commit message, with first line as descriptive
     as you can (80-char wide)
   - do not forget to SoB each patch
   - for long and/or complex patch series (even single patch), write
     an introductory message that is not gonna be part of the commit
     message, where you can explain at large what the series does,
     and explain the reasons for the changes (eg. design, bigger plan
     long-term...)
   - if it makes sense, split the patch series into shorter series,
     as that gets easier to review; say the second series depends on
     the first one. Even wait for the first to get applied before
     sending the next one

2) three cases
   a) some patches in the series get applied: end of story for those! :-)
   b) someone answers with comments
      - adress the comments
        - explain your position
        - or accept to change/fix the affected patch(es)
      - wait a litle bit, in case someone else chimes in to comment
      - update the series, and go back to 1)
   c) nobody answers
      - wait a litle bit (about three/four days)
      - answer the top-level mesage with something like:
          Ping? Any comment on that series/patch?
          Cheers! ;-)

3) if after that noone answers
   - wait a little longer, such as a good 10-15 days after your ping
   - for features, even wait for after the next release if it gets too
     close
     - better not flood the maintainer just before a release, you may
       get better chance to be noticed just after the release
   - repost the whole series
   - say that it is a repost, and why you think it is important

4) if after that, noone answers, then end of story.

That applies to about all FLOSS projects, I believe! ;-)

Patch series getting no comment might simply be because the maintainer
missed it, or forget about it (hence the ping above). Of course, rejected
series should get notified with the reasons for the rejection. :-/

But usually, a ping is enough to get noticed. :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
