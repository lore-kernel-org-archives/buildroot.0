From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Sun, 23 Nov 2008 16:29:23 -0200
Subject: [Buildroot] Building Toolchain using Cygwin
In-Reply-To: <C9699A75729D480CB8D298B179410509@jrise1>
References: <C9699A75729D480CB8D298B179410509@jrise1>
Message-ID: <d6cda7730811231029o51e046d5ue85bb4bbfdea1039@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> The goal is to have a toolchain running under Windows (host) that generates
> code for a PowerPC (target) based system that runs a busybox / uClibc Linux
> system.
>

If all you want is the toolchain, than perhaps Crosstool-ng [1] is
more suited to what you need. Althought I have never used it myself,
others on the list have spoken highly of it. I haven't heard of
success stories with buildroot and cygwin.

Kind Regards,
    Thiago A. Correa

[1] http://freshmeat.net/projects/crosstool-ng/
