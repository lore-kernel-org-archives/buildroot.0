From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 09 Mar 2018 23:30:26 +0100
Subject: [Buildroot] [PATCH 2/2] cups-filters: Add patch to remove
 relative symbolic link from install
In-Reply-To: <20180308113559.3222-2-olivier.schonken@gmail.com> (Olivier
 Schonken's message of "Thu, 8 Mar 2018 13:35:59 +0200")
References: <20180308113559.3222-1-olivier.schonken@gmail.com>
 <20180308113559.3222-2-olivier.schonken@gmail.com>
Message-ID: <87ina4g9vh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Olivier" == Olivier Schonken <olivier.schonken@gmail.com> writes:

 > On older build systems with old coreutils, using relative symbolic link
 > (ln -r) does not work, and causes failed builds. Workaround is to use
 > normal symbolic link with a relative path. e.g. ../../$(BINDIR)

 > This fix is dependent on bumping cups-filters version to 1.20.1 because
 > of autotools issue with Makefile.am changes.

 > Fixes:
 > http://autobuild.buildroot.net/results/77a6369f3530a2a6a055f7fd664f1ad424274d77

 > Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
