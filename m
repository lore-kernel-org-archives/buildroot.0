From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Oct 2018 22:13:58 +0200
Subject: [Buildroot] [PATCH] links: fix X11 library/includes detection
In-Reply-To: <20181002093015.17431-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 2 Oct 2018 11:30:15 +0200")
References: <20181002093015.17431-1-peter@korsgaard.com>
Message-ID: <87woqwywvt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/4b0/4b02713ed5c10b58f390f96ea25f2a45c9a47af4/
 > http://autobuild.buildroot.net/results/ac6/ac668f867b9de7a2c61d263a894480afc181dd9b/
 > http://autobuild.buildroot.net/results/f02/f0248b3bf4a73210f210f422c8df067a6ea28aa1/

 > The configure script uses AC_PATH_X, which searches the host for the X11
 > libraries/headers, causing build failures.

 > https://www.gnu.org/software/autoconf/manual/autoconf-2.65/html_node/System-Services.html

 > Fix it by using --x-includes / --x-libraries like we do elsewhere.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, 2018.05.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
