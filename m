From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 19:56:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/wlroots: always disable
 xcb-errors
In-Reply-To: <20200909213756.1945855-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Thu, 10 Sep 2020 00:37:56 +0300")
References: <20200909213756.1945855-1-aperez@igalia.com>
Message-ID: <87h7ryvs8c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Stop trying to enable the xcb-errors Meson option and always disable it:
 > there is no xcb-util-errors package in Buildroot. The build recipe was
 > wrongly assuming that the XCB errors library would be installed as part
 > of the xcb-util package, which is not the case.

 > Fixes the following autobuilder failure:

 >   http://autobuild.buildroot.net/results/1891aa624b29e4bbcbbe6bc752a1cc90c316024e/

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed to 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
