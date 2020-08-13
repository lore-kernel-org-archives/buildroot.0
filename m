From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Aug 2020 20:36:46 +0200
Subject: [Buildroot] [git commit] package/efl: depend on LuaJIT
In-Reply-To: <20200727203322.DE94A82AF5@busybox.osuosl.org> (Yann E. MORIN's
 message of "Mon, 27 Jul 2020 22:29:54 +0200")
References: <20200727203322.DE94A82AF5@busybox.osuosl.org>
Message-ID: <87eeoa5r5t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=f3134e71595ba33d2f9f82b9951a61e63f9e8727
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Luajit is a provider for luainterpreter. We can't select providers of
 > virtual packages; we can only depend on them.

 > Note also that it is not very clear whether the host and target variants
 > of EFL need to be built with the same lua interpreter. Today, this is
 > guaranteed as we inly use luajit in both cases. But there were issues
 > with lua 5.1 in the past, so stick to only using luajit.

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 > [yann.morin.1998 at free.fr:
 >   - depend on luajit, not "any" luainterpreter
 >   - which keeps the host and target variants built with the same
 >     interpreter
 > ]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
