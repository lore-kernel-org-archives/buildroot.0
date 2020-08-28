From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 18:58:07 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/gstreamer1/gst1-plugins-bad: fix deactivation of opencv
In-Reply-To: <20200823090429.2916770-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 23 Aug 2020 11:04:29 +0200")
References: <20200823090429.2916770-1-fontaine.fabrice@gmail.com>
Message-ID: <87lfhyr9ls.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build can fail if opencv3 is built before gst1-plugins-bad because
 > -Dopencv=disabled does not work in meson (i.e. since commit
 > 5d6c408e9535be4b5ba0c8a49215d2d03dcb5cd5)

 > Fixes:
 >  - http://autobuild.buildroot.org/results/19605057c4956d97e9e65068680485db637282db

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2:
 >  - Update commit log: the issue is there since the switch to meson
 >  - Simplify patch

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
