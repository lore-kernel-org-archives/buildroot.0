From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Apr 2020 21:10:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/cog: fix segfaults on null
 xkb_data keymap/state
In-Reply-To: <20200327182639.76711-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Fri, 27 Mar 2020 12:26:39 -0600")
References: <20200327182639.76711-1-james.hilliard1@gmail.com>
Message-ID: <87h7xvm7rs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > Fixes:
 > Program terminated with signal SIGSEGV, Segmentation fault.
 > #0  xkb_state_key_get_layout (state=state at entry=0x0, kc=kc at entry=50) at ../src/state.c:217

 > Program terminated with signal SIGSEGV, Segmentation fault.
 > #0  XkbKey (kc=kc at entry=45, keymap=0x0) at ../src/keymap.h:430

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed to 2020.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
