From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Mar 2018 23:49:58 +0100
Subject: [Buildroot] [PATCH v4,1/1] libmpdclient: fix install
In-Reply-To: <20180310214534.13121-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 10 Mar 2018 22:45:34 +0100")
References: <20180310214534.13121-1-fontaine.fabrice@gmail.com>
Message-ID: <87tvtna6ll.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > By default, meson adds the build machine architecture for installation,
 > see: https://github.com/mesonbuild/meson/issues/2535
 > Use --libdir to override this default behavior

 > Fixes:
 >  - http://autobuild.buildroot.net/results/aec/aec9f3de545a832b66cd00c217fbaa99246e1715
 >  - http://autobuild.buildroot.net/results/07a/07adcba71106a2dca963e4071f4673791b41a603
 >  - http://autobuild.buildroot.net/results/a27/a272a8e521863374901a5e3c0fb9da0b8daa4076

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v3 -> v4 (after review of Peter Korsgaard):
 >  - Use libdir instead of the ugly hack

Committed, thanks.

Are similar fixes also needed for systemd, enligtenment and mpd-mpc?

-- 
Bye, Peter Korsgaard
