From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 21:02:59 +0100
Subject: [Buildroot] [PATCH 1/2] qt5base: add optional gstreamer1 support
In-Reply-To: <1445414790-16583-1-git-send-email-peter@korsgaard.com> (Peter
 Korsgaard's message of "Wed, 21 Oct 2015 10:06:29 +0200")
References: <1445414790-16583-1-git-send-email-peter@korsgaard.com>
Message-ID: <8737wyiumk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Indirectly fixes:
 > http://autobuild.buildroot.net/results/773/773d9996bd3da283eed6b75083b8bab6469d0423/
 > http://autobuild.buildroot.net/results/069/069f564fde821b55e710fbe93fe30a5cf11a6da5/
 > http://autobuild.buildroot.net/results/456/456d380f8b4478245e89f711c33fe0c2d23aaa3a/
 > http://autobuild.buildroot.net/results/7c8/7c8ebfc93a5b11e40251495715d742520b3b8291/

 > And many more, as qt5multimedia needs qt5base to be built with gstreamer1
 > support as well.

 > While qt5 has some gstreamer 0.10 support, it doesn't seem to be used much
 > any more and E.G. the 0.10 fallback code in qt5multimedia is broken so only
 > enable it for the 1.x series.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
