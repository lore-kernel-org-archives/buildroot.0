From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Jan 2013 14:42:05 +0100
Subject: [Buildroot] [PATCH] gdb: Add support for gdb 7.5.1 and make it
	the default.
In-Reply-To: <CAFbHwiQ2bqy9HMrWHLan-M3Oy1mFBd2QOkQMoVU=NiAKkd4cQw@mail.gmail.com>
 (Will Newton's message of "Thu, 24 Jan 2013 11:33:53 +0000")
References: <CAFbHwiQ2bqy9HMrWHLan-M3Oy1mFBd2QOkQMoVU=NiAKkd4cQw@mail.gmail.com>
Message-ID: <87ip6m1yvm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

 Will> Signed-off-by: Will Newton <will.newton@imgtec.com>

Committed, thanks.

 Will> ---
 Will>  toolchain/gdb/Config.in |    9 ++++++++-
 Will>  1 files changed, 8 insertions(+), 1 deletions(-)

 Will> I'm imagine a few of those older version could be safely removed
 Will> but I am not sure which versions people are using. Aside from
 Will> avr32 and bfin is anyone using a non-7.4 version?

Yes, I think we could probably remove some of the deprecated versions
(6.8/7.0/7.1).

-- 
Bye, Peter Korsgaard
