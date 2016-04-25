From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Apr 2016 21:29:20 +0200
Subject: [Buildroot] [PATCH 1/2] package/openjpeg: bump to version 2.1
In-Reply-To: <1461597623-14629-2-git-send-email-angelo.compagnucci@gmail.com>
 (Angelo Compagnucci's message of "Mon, 25 Apr 2016 17:20:22 +0200")
References: <1461597623-14629-1-git-send-email-angelo.compagnucci@gmail.com>
 <1461597623-14629-2-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <87potdo5bj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

 > This patch bumps openjpeg to version 2.1 and converts the
 > package to use cmake.

 > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

A bit more detailed changelog would be good, E.G. the fact that it has
now moved to github. What happened to all those optional dependencies?

Looking at the 2.x release notes I see it mentions various API
changes. Have you verified that the reverse dependencies
(efl, gst1-plugins-bad, poppler) still build/work with the new version?

-- 
Bye, Peter Korsgaard
