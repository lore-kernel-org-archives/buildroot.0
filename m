From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Nov 2020 17:59:50 +0100
Subject: [Buildroot] [PATCH] package/gvfs: show warning when
 BR2_STATIC_LIBS=y
In-Reply-To: <20201118131323.3166176-1-buildroot@heine.tech> (Michael Nosthoff
 via buildroot's message of "Wed, 18 Nov 2020 14:13:22 +0100")
References: <20201118131323.3166176-1-buildroot@heine.tech>
Message-ID: <87d00ay515.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Nosthoff via buildroot <buildroot@busybox.net> writes:

 > Fixes:
 > showing "gvfs needs a toolchain w/ wchar, threads, dynamic library"
 > while also showing "gvfs[ ]"
 > when !BR2_STATIC_LIBS

 > introduced by 4266c9f54f635e8a9d0a7fdedfb1c84c1de10785

 > Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Committed, thanks.

-- 
Bye, Peter Korsgaard
