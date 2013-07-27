From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 13:18:24 +0200
Subject: [Buildroot] [PATCH] toolchain/buildroot: properly handle SSP
In-Reply-To: <1372962626-20736-1-git-send-email-gustavo@zacarias.com.ar>
References: <1372962626-20736-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130727131824.69df5bf9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  4 Jul 2013 15:30:26 -0300, Gustavo Zacarias wrote:
> The current SSP handling is incomplete.
> 
> First we need to build uClibc with SSP support for a complete
> "experience".
> 
> Second, it doesn't hurt to add -fstack-protector-all to the
> CFLAGS/CXXFLAGS since most users would expect buildroot to do this
> rather than adding the flags themselves.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed thanks. It would be nice to check whether something specific
is needed for eglibc.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
