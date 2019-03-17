From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Mar 2019 23:12:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/gst-plugins-bad: disable spandsp
In-Reply-To: <20190304173008.21826-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 4 Mar 2019 18:30:08 +0100")
References: <20190304173008.21826-1-fontaine.fabrice@gmail.com>
Message-ID: <87h8c1881o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > gst-plugins-bad does not build with spandsp so disable it (it's already
 > disabled in gst1-plugins-bad)

 > Fixes:
 >  - http://autobuild.buildroot.org/results/842ca572b7810bca70846274262a6fcdb38df49

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
