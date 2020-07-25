From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2020 23:13:29 +0200
Subject: [Buildroot] [PATCH] gitlab: generate the gitlab-ci
 configuration before each build
In-Reply-To: <20200725131548.1326260-1-romain.naour@gmail.com>
References: <20200725131548.1326260-1-romain.naour@gmail.com>
Message-ID: <20200725211329.GJ19818@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-07-25 15:15 +0200, Romain Naour spake thusly:
> Since Gitlab 12.9, Gitlab allow to trigger child pipeline with generated configuration file.
> See: https://gitlab.com/gitlab-org/gitlab/-/issues/35632
> 
> This allow us to stop updating the .gitlab-ci.yml file when a
> new defconfig is added to Buildroot.

As discussed on IRC, I'm marking this one as "Changes requested" and
will wait for the new iteration that makes use of "strategy: depend"
so that the parent pipeline fails if the child does.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
