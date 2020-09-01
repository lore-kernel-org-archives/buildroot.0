From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Sep 2020 20:40:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/graphite2: security bump to
 version 1.3.14
In-Reply-To: <20200829172541.2421772-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 29 Aug 2020 19:25:41 +0200")
References: <20200829172541.2421772-1-fontaine.fabrice@gmail.com>
Message-ID: <875z8x9w8i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Switch site to github, here is an extract of
 >   https://sourceforge.net/projects/silgraphite:
 >   "This project has been deprecated. Graphite2, a new version of the
 >   Graphite engine, is available at: https://github.com/silnrsi/graphite
 >   with its own bug tracker."
 > - graphite2 can be built statically since version 1.3.11 and
 >   https://github.com/silnrsi/graphite/commit/2f143c04da5caa43ddf4dba437b2f2bc26bf4238
 > - Update indentation in hash file (two spaces)

 > Extract from ChangeLog:

 > 1.3.14
 >     . Bug fixes
 >     . Allow features to be hidden (for aliases)
 >     . Move to python3
 >     . Rename doc files from .txt to .asc

 > 1.3.13
 >     . Resolve minor spacing issue in rtl non-overlap kerning
 >     . python3 for graphite.py
 >     . Better fuzzing
 >     . Better building on windows

 > 1.3.12
 >     . Graphite no longer does dumb rendering for fonts with no smarts
 >     . Segment caching code removed. Anything attempting to use the segment cache gets given a regular face instead
 >     . Add libfuzzer support
 >     . Builds now require C++11
 >     . Improvements to Windows 64 bit builds
 >     . Support different versions of python including 32 bit and python 3
 >     . Various minor bug fixes

 > 1.3.11
 >     . Fixes due to security review
 >     . Minor collision avoidance fixes
 >     . Fix LZ4 decompressor against high compression

 > The fixes due to security review are a little bit vague, a quick search
 > on github seems to indicate that those issues could be related to
 > segcache which has been removed since version 1.3.12:
 > https://github.com/silnrsi/graphite/search?q=security&type=Issues
 > https://github.com/silnrsi/graphite/commit/b0f77e4a9dc50a888f74e904000a2486b2fc5527

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
