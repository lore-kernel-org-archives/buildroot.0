From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Mar 2017 23:34:50 +0100
Subject: [Buildroot] [Patch v3 6/9] s6-rc: new package
In-Reply-To: <20170309233312.2c10dee9@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 9 Mar 2017 23:33:12 +0100")
References: <1482182955-23916-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1482182955-23916-7-git-send-email-eric.le.bihan.dev@free.fr>
 <20170309233312.2c10dee9@free-electrons.com>
Message-ID: <87wpbsyfed.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Mon, 19 Dec 2016 22:29:12 +0100, Eric Le Bihan wrote:
 >> This new package provides s6-rc, a service manager for s6-based systems,
 >> i.e. a suite of programs that can start and stop services, both
 >> long-running daemons and one-time initialization scripts, in the proper
 >> order according to a dependency tree.
 >> 
 >> The host variant is provided so s6-rc-compile is available and can
 >> be used to build the services database offline, either in a package
 >> Makefile or a post-build script.

Hmm, shouldn't it then have a Config.in.host so it can be enabled for
post-build scripts?

-- 
Bye, Peter Korsgaard
