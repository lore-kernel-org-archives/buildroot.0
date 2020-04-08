From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Apr 2020 16:29:15 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/vlc: fix build with opencv3
In-Reply-To: <20200308222246.1392316-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 8 Mar 2020 23:22:46 +0100")
References: <20200308222246.1392316-1-fontaine.fabrice@gmail.com>
Message-ID: <87tv1uhwzo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fixes:
 >  - http://autobuild.buildroot.org/results/210424bd33f660aa0757f62a558e1e03faf0f371

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Thomas Petazzoni):
 >  - Update patch so it does not break the build with OpenCV 2.x

Committed to 2019.02.x, 2019.11.x and 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
