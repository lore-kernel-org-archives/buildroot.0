From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Aug 2014 11:29:55 +0200
Subject: [Buildroot] [git commit branch/next] host-gdb: enable terminal
	user interface support
In-Reply-To: <20140830093129.0a86d2b7@free-electrons.com> (Thomas Petazzoni's
 message of "Sat, 30 Aug 2014 09:31:29 +0200")
References: <20140830071153.50ADD9D59A@busybox.osuosl.org>
 <20140830093129.0a86d2b7@free-electrons.com>
Message-ID: <871trypbos.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Peter Korsgaard,
 > On Sat, 30 Aug 2014 09:03:34 +0200, Peter Korsgaard wrote:

 >> +config BR2_PACKAGE_HOST_GDB_TUI
 >> +	bool "GDB TUI support"
 >> +	select BR2_PACKAGE_NCURSES

 > It seems like you didn't commit v2, because v2 was fixing this.

Yeah, seems like I ended up using the wrong pw id. It's fixed now.

-- 
Bye, Peter Korsgaard 
