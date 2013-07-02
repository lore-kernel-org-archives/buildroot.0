From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Jul 2013 09:38:52 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-07-01
In-Reply-To: <20130702063005.2F3D352C121@lolut.humanoidz.org>
References: <20130702063005.2F3D352C121@lolut.humanoidz.org>
Message-ID: <20130702093852.123fdc11@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Tue,  2 Jul 2013 08:30:05 +0200 (CEST), Thomas Petazzoni wrote:

> Classification of failures by reason
> ====================================
> 
>         ltp-testsuite-20130109 | 8 

Can you adjust your build script to not build ltp-testsuite when using
uClibc? It is well known that our default uClibc configuration doesn't
have all the necessary bits to build ltp-testsuite.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
