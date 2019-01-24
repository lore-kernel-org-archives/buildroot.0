From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 17:19:36 +0100
Subject: [Buildroot] [PATCH v2,
 1/2] cc-tool: drop BR2_PACKAGE_BOOST_SIGNALS select
In-Reply-To: <20190113174316.26267-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 13 Jan 2019 18:43:15 +0100")
References: <20190113174316.26267-1-fontaine.fabrice@gmail.com>
Message-ID: <87bm46do4n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > cc-tool depends on signals2 not signals, indeed only signals2 is used in
 > src/data/progress_watcher.h and BOOST_SIGNALS defined in m4/boost.m4 is
 > never used in configure.ac

 > No BR2_PACKAGE_SIGNALS2 is needed as signals2 is a header-only boost
 > library

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Thomas Petazzoni):
 >  - Give more details in commit log

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
