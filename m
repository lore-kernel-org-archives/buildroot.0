From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 23:05:10 +0200
Subject: [Buildroot] [PATCH v7 18/23] support/test-pkg: add option to
 use an alternate toolchains CSV file
In-Reply-To: <20170721010530.4747-19-arnout@mind.be>
References: <20170721010530.4747-1-arnout@mind.be>
 <20170721010530.4747-19-arnout@mind.be>
Message-ID: <20170725230510.0282a9ea@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Jul 2017 03:05:25 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> For now, testing a package requires network access. However, there are

I don't see what network access has to do with this. Thanks to your
previous commit, the toolchain config CSV file is local, so there is no
longer the need for network access.

Isn't that part of the commit log somewhat outdated ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
