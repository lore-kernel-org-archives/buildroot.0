From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Jun 2020 22:02:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/prosody: use correct bit32
 package
In-Reply-To: <20200525025053.3354588-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Sun, 24 May 2020 20:50:53 -0600")
References: <20200525025053.3354588-1-james.hilliard1@gmail.com>
Message-ID: <87r1uyh7vi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > According to https://prosody.im/doc/depends#bitop the correct bitop
 > package to use with prosody for Lua 5.1 is:
 > https://luarocks.org/modules/siffiejoe/bit32

 > As such replace BR2_PACKAGE_LUABITOP with BR2_PACKAGE_LUA_BIT32

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
