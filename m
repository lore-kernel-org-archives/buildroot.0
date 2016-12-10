From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Dec 2016 21:31:29 +0100
Subject: [Buildroot] [PATCH] package/enlightenment: remove uClibc
 (legacy) workaround
In-Reply-To: <1481385046-5643-1-git-send-email-romain.naour@gmail.com>
References: <1481385046-5643-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161210213129.701fdacf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Dec 2016 16:50:46 +0100, Romain Naour wrote:
> Buildroot doesn't support uClibc (legacy) since 2016.02 release, so
> this workaround is not needed anymore.

BR2_TOOLCHAIN_USES_UCLIBC=y when uClibc-ng is used, I'm sure you now
that. Is this problem fixed in uClibc-ng? If so, it would be good to
mention that in the commit log, because right now, the wording of the
commit log is somewhat confusing in that regard.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
