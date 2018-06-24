From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sun, 24 Jun 2018 21:16:39 +0530
Subject: [Buildroot] [PATCH] uboot: don't override HOSTCC/HOSTLDFLAGS
 for kconfig
In-Reply-To: <20180624141242.16851-1-peter@korsgaard.com>
References: <20180624141242.16851-1-peter@korsgaard.com>
Message-ID: <CAMty3ZAbRUzT98nmyhF=ZuxpNzBx27izLA0VDsHCuR7crWTWog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jun 24, 2018 at 7:42 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> So the host ncurses includes and library are used instead of a mix of both,
> causing corrupted characters.  Similar to the linux fix in commit
> 6d3d09e23213e8 (linux: don't override HOSTCC for kconfig), except that we
> pass the linker flags in HOSTLDFLAGS.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Acked-by: Jagan Teki <jagan@amarulasolutions.com>
