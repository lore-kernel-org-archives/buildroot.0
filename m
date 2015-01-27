From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Jan 2015 23:11:39 +0100
Subject: [Buildroot] [PATCH] squid: fix old distro gcc build failure
In-Reply-To: <1422390654-8429-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 27 Jan 2015 17:30:54 -0300")
References: <1422390654-8429-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87386vyiuc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Squid 3.5.x deprecated the use of HOSTCXX & friends in favour of
 > BUILDCXX and BUILDCXXFLAGS.
 > When they are not specified BUILDCXXFLAGS takes flags from target
 > CXXFLAGS which specifies C11 standard and which older vesions of gcc
 > don't understand, thus causing breakage.
 > cf_gen hasn't got any C11 features so it's not required. Fixes:
 > http://autobuild.buildroot.net/results/816/8162e4ec941e7642248373be47cca99113a648e8/

 > Also drop ACLOCAL and AUTOMAKE trickery from e27ccbab since it's no
 > longer required.

 > And fix a typo in the hash file pointing to an improper hash file
 > upstream.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
