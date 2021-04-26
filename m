From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 09:08:46 +0200
Subject: [Buildroot] [PATCH RESEND] package/systemd: fix homed
 dependency warning
In-Reply-To: <20210416072956.151549-1-buildroot@heine.tech> (Michael Nosthoff
 via buildroot's message of "Fri, 16 Apr 2021 09:29:54 +0200")
References: <20210416072956.151549-1-buildroot@heine.tech>
Message-ID: <87tunto741.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Nosthoff via buildroot <buildroot@busybox.net> writes:

 > Fixes:
 > showing "enable home daemon"
 > and "homed support needs a toolchain w/ threads, dynamic library, kernel headers >= 4.12"
 > when BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12

 > introduced by fa62b5165ca41e4800e00a84af9026bfa5fb9155

 > Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
