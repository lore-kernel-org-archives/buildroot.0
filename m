From: Ash Charles <ashcharles@gmail.com>
Date: Sun, 12 Jan 2020 15:14:46 -0500
Subject: [Buildroot] 32-bit host tools for ti-cgt-pru package
In-Reply-To: <20200112211016.59ffbef2@windsurf>
References: <CAK8F28m1MVtDtB+9DhhhQTgODneKB1WGW9Gy_FtPL2O7ikQb_w@mail.gmail.com>
 <20200112211016.59ffbef2@windsurf>
Message-ID: <CAK8F28=Rn0eWNgCwtYVj8QmysfRJdV-TO8F9c01eaCHvBy1_ng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 12, 2020 at 3:10 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
<snip>
> We do have an option named BR2_HOSTARCH_NEEDS_IA32_LIBS which packages
> that are pre-built for x86-32 can depend on. When this option is
> selected, Buildroot will refuse to start the build if the system is
> x86-64 and doesn't have the 32-bit compat libraries. We already use it
> in a few packages, and some external toolchains.
Perfect -- thanks for the hint.  I figured I was missing something :).
I'll test out and hope to submit a patch adding this option.

--Ash
