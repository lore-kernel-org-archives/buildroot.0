From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 09:02:57 +0200
Subject: [Buildroot] [PATCH 1/2] slang: use correct ncurses config
	script name
In-Reply-To: <20170326063654.10068-1-rprebello@gmail.com> (Rodrigo Rebello's
 message of "Sun, 26 Mar 2017 03:36:53 -0300")
References: <20170326063654.10068-1-rprebello@gmail.com>
Message-ID: <87k276x71a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rodrigo" == Rodrigo Rebello <rprebello@gmail.com> writes:

 > The ncurses config script can have different names depending on the
 > configuration (e.g. wchar support enabled/disabled). So, use
 > $(NCURSES_CONFIG_SCRIPTS) from the ncurses package as it contains the
 > proper name.

 > Fixes:

 >   http://autobuild.buildroot.net/results/c97554c05e121c76407be53ba37924cfcb658e9d/
 >   http://autobuild.buildroot.net/results/b0a31a3491a30ee0d6e6e7dbba68a86f0e00943d/
 >   http://autobuild.buildroot.net/results/a77241141cf8710fa945523ef62327798e3c4824/
 >   [...]

 > Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
