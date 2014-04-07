From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Apr 2014 00:56:35 +0200
Subject: [Buildroot] [PATCH 1/1] libubox: Disable lua binding on no mmu
In-Reply-To: <1396902806-2308-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Mon, 7 Apr 2014 22:33:26 +0200")
References: <1396902806-2308-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87eh18d9zw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > The Lua binding option of libubox need to be
 > explicitly disabled on no mmu case.

 > Fixes:
 > http://autobuild.buildroot.net/results/1a5/1a5c50f8ca0ae70c1e0d3733765f521790b97a30/build-end.log

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
