From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Dec 2018 23:11:15 +0100
Subject: [Buildroot] [PATCH 1/1] systemd: fix build with gcc <= 4.7
In-Reply-To: <20181129180647.8422-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 29 Nov 2018 19:06:47 +0100")
References: <20181129180647.8422-1-fontaine.fabrice@gmail.com>
Message-ID: <87bm622rcs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Pass -Werror=shadow in args of cc.compiles in meson.build otherwise test
 > will always succeed

 > Fixes:
 >  - http://autobuild.buildroot.org/results/ffd71c473d3b29618c18cd2e04705370266696f2

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
