From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 22:37:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_xdriinfo: fix libgl
 dependency
In-Reply-To: <20171113192349.32543-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Mon, 13 Nov 2017 20:23:49 +0100")
References: <20171113192349.32543-1-bernd.kuhls@t-online.de>
Message-ID: <871skken6a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes
 > "mesa3d is in the dependency chain of xapp_xdriinfo that has added it
 >  to its _DEPENDENCIES variable without selecting it or depending on it
 >  from Config.in."
 > http://autobuild.buildroot.net/results/d8a/d8aeed2f64e21a277eb0bc5dc08d2339a14c682e/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > Bug was introduced in 2014:
 > https://git.buildroot.net/buildroot/commit/package/x11r7/xapp_xdriinfo/Config.in?id=e49a0c656a1a27b80bca730f40101f6ff37d42af

Committed to 2017.02.x and 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
