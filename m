From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jan 2016 20:01:11 +0100
Subject: [Buildroot] [PATCH] lighttpd: requires a Lua 5.1.x
In-Reply-To: <1453030107-7010-1-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Sun, 17 Jan 2016 12:28:27 +0100")
References: <1453030107-7010-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <8760yq7lvs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > see failure in http://autobuild.buildroot.net/results/13f/13faa9ebce00359b8943775364a432ce422fe8b8/
 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

How about we instead backport r3070, which afaik should be included in
the next release:

https://redmine.lighttpd.net/issues/2674

-- 
Bye, Peter Korsgaard
