From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 06 Jan 2014 00:06:01 +0100
Subject: [Buildroot] [PATCH] dbus-cpp: fix cross build for tools when
	expat is missing
In-Reply-To: <1388948439-9882-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 5 Jan 2014 16:00:39 -0300")
References: <1388948439-9882-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87d2k6yqp2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > dbus-c++ tools use CXX_FOR_BUILD to build in cross scenarios, however
 > they don't use CXXFLAGS_FOR_BUILD nor LDFLAGS_FOR_BUILD thus breaking
 > when there aren't any expat devel files in the default PATHs (build
 > host). Fixes:
 > http://autobuild.buildroot.net/results/44f/44fc2cab2b60aa82460bb46b1035ddda115af750/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
