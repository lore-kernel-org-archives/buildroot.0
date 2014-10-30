From: =?ISO-8859-1?Q?J=F6rg?= Krause <jkrause@posteo.de>
Date: Thu, 30 Oct 2014 08:17:11 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-10-28
In-Reply-To: <20141029073016.28E5B1008B6@stock.ovh.net>
References: <20141029073016.28E5B1008B6@stock.ovh.net>
Message-ID: <1414653431.5132.3.camel@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mi, 2014-10-29 at 08:30 +0100, Thomas Petazzoni wrote:
> Build statistics for 2014-10-28
> ===============================

>         i686 |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/4fe9e74f49a2c3819ed4f721f2ac8d947e48f597/

help2man error:
        help2man: can't get `--help' info from ./mp4art
        Try `--no-discard-stderr' if option outputs to stderr

I don't know how to handle this.

>      powerpc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/e93653ccc815c805f4af55910c2995372587e7b4/

toolchain error?
        powerpc-ctng_e500v2-linux-gnuspe-g++: error: unrecognized
        command line option '-mfloat-Wa,-me500x2'
        

>          arm |           shairport-sync-2.1.5 | NOK | http://autobuild.buildroot.net/results/cb41980f2fb416d627bea0950e1dae727eae0ca6/

Missing avahi-client library. I will fix this.
