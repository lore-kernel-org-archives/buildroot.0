From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Mar 2020 17:23:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/cog: add patch fixing cog
 segfault
In-Reply-To: <20200218084339.21371-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Tue, 18 Feb 2020 01:43:39 -0700")
References: <20200218084339.21371-1-james.hilliard1@gmail.com>
Message-ID: <871rpwz0jx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > Fixes:
 > Thread 1 "cog" received signal SIGSEGV, Segmentation fault.
 > xkb_state_update_mask (state=0x0, base_mods=0, latched_mods=0,
 > locked_mods=0, base_group=base_group at entry=0,
 > latched_group=latched_group at entry=0, locked_group=0) at
 > ../src/state.c:814
 > 814	    prev_components = state->components;

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
