From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 22:45:43 +0100
Subject: [Buildroot] [PATCH 1/1] trace-cmd: overwrite CFLAGS
In-Reply-To: <526D9ED3.4000401@openwide.fr>
References: <526D9ED3.4000401@openwide.fr>
Message-ID: <20131030224543.5fd2a90d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Mon, 28 Oct 2013 00:16:35 +0100, Romain Naour wrote:
> 
> Ptrace support detection is ignored when CFLAGS is set by buildroot.
> 
> Use override in Makefile to add -DWARN_NO_PTRACE and -DNO_PTRACE in CFLAGS
> if ptrace is not available.
> 
> Fixes:
> http://autobuild.buildroot.net/results/60e/60ed317d52d93ba2c087aa6ff4f422d760806d89//
> 
> Signed-off-by: Romain <romain.naour@openwide.fr>

Applied to for-peter-2013.11, thanks. However, your patch was badly
line-wrapped. Could you use 'git send-email' for your next patches,
instead of Thunderbird?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
