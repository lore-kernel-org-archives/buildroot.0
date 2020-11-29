From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Nov 2020 22:18:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-good:
 qmlgl needs gstreamer-gl-1.0
In-Reply-To: <20201128155409.1809491-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 28 Nov 2020 16:54:09 +0100")
References: <20201128155409.1809491-1-fontaine.fabrice@gmail.com>
Message-ID: <87r1obq2uq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build of qmlql fails without gstreamer-gl-1.0 since version 1.17.1 and
 > https://github.com/GStreamer/gst-plugins-good/commit/2ecba800bfbf177bc56999dc59ecdff00cbc353c

 > Fixes:
 >  - http://autobuild.buildroot.org/results/e1537ebac7cd70b6d868a8b7f0205ce3d8593508

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
