From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 11 May 2013 23:01:12 +0200
Subject: [Buildroot] [PATCH 1/1] Unhide lttng-tools and lttng-modules
In-Reply-To: <1368262741-24215-1-git-send-email-olivier.schonken@gmail.com>
 (Olivier Schonken's message of "Sat, 11 May 2013 10:59:01 +0200")
References: <1368262741-24215-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <87r4hdz0x3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Olivier" == Olivier Schonken <olivier.schonken@gmail.com> writes:

 Olivier> When using lttng-tools for userland tracing with lttng-libust
 Olivier> lttng-modules is not required, thus a dependency on building
 Olivier> lttng-modules and a kernel is overkill for lttng-tools.  It
 Olivier> also hides it from a user not wanting to build a kernel.  A
 Olivier> comment has been added to lttng-modules to show a user that
 Olivier> lttng-modules is dependent on a kernel build.

Committed, thanks.

-- 
Bye, Peter Korsgaard
