From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Feb 2021 21:09:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-python: needs
 gst1-plugins-base
In-Reply-To: <20210110190616.1023612-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 10 Jan 2021 20:06:16 +0100")
References: <20210110190616.1023612-1-fontaine.fabrice@gmail.com>
Message-ID: <87im6r7p11.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > gst1-plugins-base is a mandatory dependency since at least version
 > 1.9.90 and
 > https://github.com/GStreamer/gst-python/commit/16f971226df1980b58ebde330123debaaf3b53d0

 > Fixes:
 >  - http://autobuild.buildroot.org/results/48b22c66c3a610d70931b9adfd6e5082bb3ff3d1

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
