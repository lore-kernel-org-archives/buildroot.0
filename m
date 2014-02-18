From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Feb 2014 22:06:02 +0100
Subject: [Buildroot] [PATCH 0/6] Add toolchain knob for NPTL
In-Reply-To: <20140213074617.283682ce@core2quad.morethan.org>
References: <1392297727-17627-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140213074617.283682ce@core2quad.morethan.org>
Message-ID: <20140218220602.563f48c3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mike Zick,

On Thu, 13 Feb 2014 07:46:17 -0600, Mike Zick wrote:

> With the line length limitations, shouldn't variable names be kept to
> less than 1/2 the line length limits?  ;)

BR2_TOOLCHAIN_HAS_THREADS_NPTL is only 30 characters, which is less
than 1/2 the line length limit :)

> Rhetorical:
> Can a toolchain **without threads** support NPTL ?

No, indeed not.

> With the above considerations, perhaps the knob could be:
> BR2_TOOLCHAIN_NPTL

I don't like this, because it's not very expressive. I could reduce it
to BR2_TOOLCHAIN_HAS_NPTL indeed, but I find
BR2_TOOLCHAIN_HAS_THREADS_NPTL to be more expressive. Do others have
different opinions?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
