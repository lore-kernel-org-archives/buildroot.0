From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 05 Jul 2015 09:54:09 +0200
Subject: [Buildroot] Question on the Auto-builder
In-Reply-To: <20150704125435.47827cda@core2quad.morethan.org> (Mike's message
 of "Sat, 4 Jul 2015 12:54:35 -0500")
References: <20150704125435.47827cda@core2quad.morethan.org>
Message-ID: <87si93rqe6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike  <mikez@OpenPlayer.org> writes:

Hi,

 > Are the auto-builders set up so that once they 
 > select either Lua or LuaJIT, they also select
 > some (or all) of the modules.

Largely so. They work with configuration snippets selecting a specific
toolchain configuration and then a random package selection (what you
get with make randpackageconfig).

The script is publicly available if you are interested in the details:

http://git.buildroot.org/buildroot-test/tree/scripts/autobuild-run#n493

-- 
Bye, Peter Korsgaard
