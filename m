From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Sep 2020 09:39:33 +0200
Subject: [Buildroot] [PATCH 00/10] gitlab-ci: handle all conditional
 jobs in the generating script (branch yem/gitlab-ci-cond)
In-Reply-To: <c586aee9-0ea1-afb6-4634-b34908f00a57@gmail.com>
References: <cover.1599423132.git.yann.morin.1998@free.fr>
 <c586aee9-0ea1-afb6-4634-b34908f00a57@gmail.com>
Message-ID: <20200909073933.GO14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-09-08 22:47 +0200, Romain Naour spake thusly:
> Le 06/09/2020 ? 22:12, Yann E. MORIN a ?crit?:
> > Hello All!
> > 
> > The grammar in gitlab-CI yaml, to specify conditions under which jobs
> > should be spawned or not, is not very nice to handle.
> > 
> > Take adavantage of the fact that we are now generating the pipeline
> > description from a script, to decide in that script exactly what jobs
> > should be spawned.
> > 
> > This is both more usual, to use a classic scripting language (shell for
> > now, but could be whatever in the future), and more versatile (we can
> > more easilt express conditions than in the limited gitlab-CI YAML).
> 
> On one hand, it's a pity to workaround the gitlab-ci Yaml and not take the
> opportunity to practice this specific language...
> But on the other hand the language is not still stable over the time (see the
> only/except keyword deprecation we used until recently).
> Also the generate-gitlab-ci-yml after this series doesn't seem too complex :)
> 
> Maybe we can complete the manual about defconfigs testing in gitlab.
> runtime-tests in gitlab is already described in the manual.

Thanks for the review. Series applied to master now.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
