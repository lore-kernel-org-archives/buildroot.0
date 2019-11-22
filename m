From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Nov 2019 23:14:35 +0100
Subject: [Buildroot] [PATCH v2,1/4] package/spice: disable tests
In-Reply-To: <20191117164452.5361-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 17 Nov 2019 17:44:49 +0100")
References: <20191117164452.5361-1-fontaine.fabrice@gmail.com>
Message-ID: <87o8x3zhh0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > By disabling tests, we'll remove the optional gdk-pixbuf dependency
 > Fixes:
 >  - http://autobuild.buildroot.org/results/96c786f85d35f33508e9c71778043d16b87f72cd

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Yann E. Morin):
 >  - Disable tests instead of adding and fixing gdk-pixbuf optional
 >    dependency

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
