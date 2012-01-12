From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Jan 2012 10:17:30 +0100
Subject: [Buildroot] Can't use output/host/ as "SDK" with external
 toolchain
In-Reply-To: <CAJpxd07HP8j=A15yW-PKg_SbMVw3tCeMvTodx2BdcCjR7-7rmQ@mail.gmail.com>
References: <CAJpxd07HP8j=A15yW-PKg_SbMVw3tCeMvTodx2BdcCjR7-7rmQ@mail.gmail.com>
Message-ID: <20120112101730.472c6e92@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bryce,

Le Mon, 9 Jan 2012 14:54:13 -0800,
Bryce Schober <bryce.schober@gmail.com> a ?crit :

> What I mean by "SDK" is the ability to compile external programs
> using the buildroot toolchain and libraries on any
> reasonably-compatible host. I'm assuming that the toolchain itself is
> built properly static for its own host independence (which in my
> case, it is). Ideally the toolchain in the output/host directory
> would be capable of standing alone, when built properly
> 
> I'm having two issues w/ archving the output/host dir for extraction
> and usage in a different host directory. I'm using a custom-built
> crosstool-ng built externally and independent of buildroot.

As Peter has mentioned, moving the "SDK" to a different directory is
currently not supported. It has been discussed during our last meeting
in Prague, we listed the different things that we think need to be
fixed, but the work hasn't been done yet.

The meeting report that Peter has mentioned lists the different issues
that need to be fixed. So if you want to help, feel free to start with
this list :)

Those items are also on my TODO-list, but that one is so long that I
can't guarantee when I'll be able to do it.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
