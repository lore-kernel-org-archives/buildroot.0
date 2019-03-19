From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Mar 2019 21:33:27 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/gst-plugins-bad: remove apexsink support
In-Reply-To: <20190305220104.16670-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 5 Mar 2019 23:01:04 +0100")
References: <20190305220104.16670-1-fontaine.fabrice@gmail.com>
Message-ID: <87a7hqfvu0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > apexsink does not build with OpenSSL 1.1.x so remove this option
 > especially because there is no more apexsink option in gstreamer1 (since
 > version 1.12)

 > Fixes:
 >  - http://autobuild.buildroot.org/results/a29e8a8509190fc4b3c419dae2301cf72a601f62

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Thomas Petazzoni):
 >  - Update commit message with information about gstreamer1

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
