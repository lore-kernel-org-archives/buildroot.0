From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 22:21:38 +0200
Subject: [Buildroot] [PATCH] syslog-ng: Add upstream patches to support
 python 3
In-Reply-To: <1445334272-3388-1-git-send-email-judge.packham@gmail.com>
References: <1445334272-3388-1-git-send-email-judge.packham@gmail.com>
Message-ID: <20151021222138.6974cc89@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Packham,

On Tue, 20 Oct 2015 22:44:32 +1300, Chris Packham wrote:
> From https://github.com/balabit/syslog-ng/pull/711
> 
> Fixes:
> http://autobuild.buildroot.net/results/8bf/8bfb199bda2218252bc21b228066d41af37e2753/
> http://autobuild.buildroot.net/results/ab8/ab8ec583d1836d0c246ac792391549bfe277ce76/
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>  package/syslog-ng/syslog-ng.hash | 5 +++++
>  package/syslog-ng/syslog-ng.mk   | 6 ++++++
>  2 files changed, 11 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
