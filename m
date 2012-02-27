From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Feb 2012 00:34:04 +0100
Subject: [Buildroot] [PATCH 2/4] libglib2: update to version 2.30.2
In-Reply-To: <1330346337-27342-3-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Mon, 27 Feb 2012 13:38:55 +0100")
References: <1330346337-27342-1-git-send-email-s.neumann@raumfeld.com>
 <1330346337-27342-3-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87aa433l77.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Update to latest stable release and add a dependency on libffi which
 Sven> is needed by GObject.

Looks like we'll need to fiddle with _CONF_ENV:

checking for qsort_r... yes
checking if qsort_r uses glibc compatible argument order... configure: error: in `/home/peko/source/buildroot/output/build/libglib2-2.30.2':
configure: error: cannot run test program while cross compiling
See `config.log' for more details

This is default internal toolchain config, ARM A8.

-- 
Bye, Peter Korsgaard
