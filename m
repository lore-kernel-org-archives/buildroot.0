From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 May 2010 14:12:04 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	graph-dependencies
In-Reply-To: <cover.1274448102.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Fri, 21 May 2010 15:22:11 +0200")
References: <cover.1274448102.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87k4qpv90r.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> As requested by Peter, here is the pull request for the dependency
 Thomas> graph generation script.

 Thomas> Thomas

 Thomas> The following changes since commit f3122259e2cbbc0be0fc02820a146b4e4f48bef6:
 Thomas>   Peter Korsgaard (1):
 Thomas>         mtd-utils: buildsystem is broken with parallel make (regarding libubi)

 Thomas> are available in the git repository at:

 Thomas>   git://git.busybox.net/~tpetazzoni/git/buildroot graph-dependencies

Pulled, thanks.

 Thomas> Thomas Petazzoni (4):
 Thomas>       package: Add new <pkg>-show-depends to list dependencies
 Thomas>       Add a <fs>-root-show-depends target
 Thomas>       Add a show-targets target
 Thomas>       New graph-depends script

-- 
Bye, Peter Korsgaard
