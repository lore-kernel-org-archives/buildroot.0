From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Apr 2010 20:12:25 +0200
Subject: [Buildroot] External toolchain built by buildroot no longer
 supported.
In-Reply-To: <hpfh61$drp$1@dough.gmane.org>
References: <hpfh61$drp$1@dough.gmane.org>
Message-ID: <20100406201225.2b24b255@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Grant,

On Tue, 6 Apr 2010 14:41:05 +0000 (UTC)
Grant Edwards <grant.b.edwards@gmail.com> wrote:

> Are we to assume that crosstool-NG is now the "officially supported"
> source for external toolchains?

No. Yann (the author of the commit) and I have started discussing the
issue yesterday evening, and tried to find a satisfying solution. We
hope to get such a solution integrated before 2010.05.

> When I asked a few months ago if there was any reason I shouldn't use
> external toolchains built by buildroot, I was told there were none.
> 
> Has that changed?

No, it hasn't changed. But there are bugs, and we need to fix them.
External toolchain support is still in its early ages, and it needs to
be improved. Your current feedback and comments are therefore very
welcome.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
