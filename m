From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Mar 2019 11:26:00 +0100
Subject: [Buildroot] [PATCH-2019.02] package/glibc: bump version for
 additional post-2.28 security fixes
In-Reply-To: <12873_1553853207_5C9DEB17_12873_476_1_20190329095325.GD2625@r-lnx-nyma7486-2>
 (yann morin's message of "Fri, 29 Mar 2019 10:53:25 +0100")
References: <20190329094714.10437-1-peter@korsgaard.com>
 <12873_1553853207_5C9DEB17_12873_476_1_20190329095325.GD2625@r-lnx-nyma7486-2>
Message-ID: <87r2aqj7t3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>   <yann.morin@orange.com> writes:

Hi,

 >> # Generate version string using:
 >> #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
 >> -GLIBC_VERSION = glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1
 >> +GLIBC_VERSION = glibc-2.28-94-g4aeff335ca19286ee2382d8eba794ae5fd49281a

 > If you drop the leading 'glibc-' from the version string, it still
 > works, and makes for nicer filenames, as we have in master now for
 > glibc-2.29.

Yes, I considered to do that..

 > Note that, for 2019.02 that is an LTS, we may want to keep the ugly
 > filenames, though, for stability for those that have "instrumentation
 > scripts" above buildroot.

.. and decided I wanted to keep things like they are for 2019.02.

-- 
Bye, Peter Korsgaard
