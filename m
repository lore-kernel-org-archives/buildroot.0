From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Dec 2014 18:25:25 +0100
Subject: [Buildroot] [PATCH 0/24 v3] ejabberd: XMPP server (branch
 yem/ejabberd)
In-Reply-To: <CAJtjsKYdgLhoNujsxrKA1C4yKdvBZFvSfCz-yEC=p7BsPvRy+g@mail.gmail.com>
References: <cover.1415751395.git.yann.morin.1998@free.fr>
 <20141122211947.2d556071@free-electrons.com>
 <CAJtjsKYdgLhoNujsxrKA1C4yKdvBZFvSfCz-yEC=p7BsPvRy+g@mail.gmail.com>
Message-ID: <20141208172525.GA4105@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johan, All,

On 2014-12-08 17:33 +0100, Johan Oudinet spake thusly:
> I've looked into Yann's branch and made some modifications to fix the
> compilation and runtime errors.
> I've also find out and fix the issue with erl_interface, which ld does
> not find if we compile an erlang library after finalizing make once:
> It's because rebar was looking for such libraries in $(TARGET_DIR)
> instead of $(STAGING_DIR), and libraries in TARGET_DIR are deleted by
> the target-finalize Makefile rule.
> How should I share these modifications? I guess I cannot push to
> Yann's git repository.
> Should I send again a patch series, even though Yann has not finished
> its review yet?

I think I won;t do much more review on the series you already posted. I
don't remember exactly, but IIRC I've done some changes on your patches,
which are now in my branch.

The best way to move forward is for you to take the patches from my
branch, work on them, and respin the series on the list.

Afterall, you are in the best position to work on the core
functionality, since you have good knowledge of Erlang and ejabberd.

I can help round the edges (aka. code style and eye-candy), so I'll wait
for you to respin the series before looking further into it.

So yes, just respin on the list! ;-)

And as Thomas said, you can pop up in #buildroot, where we hang together
for discussing, guess what, Buildroot! ;-)

Thank you for your work on this!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
