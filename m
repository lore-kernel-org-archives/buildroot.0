From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 09:08:57 +0100
Subject: [Buildroot] [PATCH 1/1] trace-cmd: overwrite CFLAGS
In-Reply-To: <526FEAD0.7090908@mind.be>
References: <526D9ED3.4000401@openwide.fr>
	<526FEAD0.7090908@mind.be>
Message-ID: <20131030090857.0b9555e6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 29 Oct 2013 18:05:20 +0100, Arnout Vandecappelle wrote:

>   However, we should also add NO_PTRACE to TRACE_CMD_MAKE_OPTS if 
> BR2_PACKAGE_PTRACE is not selected, and add ptrace to the dependencies if 
> it is.

Huh? ptrace is not a package, it's a libc function. See man ptrace(2).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
