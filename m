From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 11:24:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-python: needs
 gst1-plugins-base
In-Reply-To: <87im6r7p11.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 16 Feb 2021 21:09:46 +0100")
References: <20210110190616.1023612-1-fontaine.fabrice@gmail.com>
 <87im6r7p11.fsf@dell.be.48ers.dk>
Message-ID: <87lfbn3sb1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> gst1-plugins-base is a mandatory dependency since at least version
 >> 1.9.90 and
 >> https://github.com/GStreamer/gst-python/commit/16f971226df1980b58ebde330123debaaf3b53d0

 >> Fixes:
 >> - http://autobuild.buildroot.org/results/48b22c66c3a610d70931b9adfd6e5082bb3ff3d1

 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 > Committed, thanks.

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
