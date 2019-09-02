From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Sep 2019 13:42:13 +0200
Subject: [Buildroot] [PATCH] package/dhcp: install shared libraries
In-Reply-To: <20190809022759.8601-1-unixmania@gmail.com>
 (unixmania@gmail.com's message of "Thu, 8 Aug 2019 23:27:59 -0300")
References: <20190809022759.8601-1-unixmania@gmail.com>
Message-ID: <87imqazzze.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > We don't use "make install" for target installation because we build all
 > utilities (server, relay, client) but install only the selected ones.

 > The utilities, however, require the shared libraries to work, so use the
 > "install-exec" make target to install them. This also installs static
 > libraries but they are removed later by target-finalize.

 > With this change the omshell utility is installed if server is selected.
 > We keep it, since it is small and may be useful at run-time.

 > Fixes:
 >   https://bugs.busybox.net/show_bug.cgi?id=12086

 > Signed-off-by: Carlos Santos <unixmania@gmail.com>

Committed to 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
