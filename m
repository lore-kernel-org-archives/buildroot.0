From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 08 Dec 2013 10:40:48 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-12-07
In-Reply-To: <20131208073009.673C5101507@stock.ovh.net> (Thomas Petazzoni's
 message of "Sun, 8 Dec 2013 08:30:09 +0100 (CET)")
References: <20131208073009.673C5101507@stock.ovh.net>
Message-ID: <87ppp7brz3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Build statistics for 2013-12-07
 > ===============================

 >         success : 74 
 >        failures : 63 
 >        timeouts : 3  
 >           TOTAL : 140

 > Classification of failures by reason
 > ====================================

 > gpsd-327a3ef7c83c1b3b2cf7cd... | 26
 >                       opus-1.1 | 20
 >                        unknown | 3 
 >                      m4-1.4.17 | 3 
 >                   nettle-2.7.1 | 2 
 >                  ffmpeg-0.8.15 | 2 
 >                  libpfm4-4.3.0 | 1 
 >                  distcc-2.18.3 | 1 
 >                       icu-51.2 | 1 
 >                 openssl-1.0.1e | 1 
 >                 elfutils-0.155 | 1 
 >                      lua-5.1.5 | 1 
 >   toolchain-external-undefined | 1 
 > dtc-e4b497f367a3b2ae99cc520... | 1 
 >                 aiccu-20070115 | 1 
 >                alsa-lib-1.0.26 | 1 

 > Detail of failures
 > ===================
 >     x86_64 |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/20de860c40c23d0524db7a2d2197a9f29a733e76/

Looks like a bashism in the configure script. Will look into it.

-- 
Bye, Peter Korsgaard
