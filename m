From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 21:29:30 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: preserve ncurses progs/tools
In-Reply-To: <20170414105941.151a95d6@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 14 Apr 2017 10:59:41 +0200")
References: <1492140047-60102-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20170414105941.151a95d6@free-electrons.com>
Message-ID: <87k269vc2t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Thu, 13 Apr 2017 22:20:47 -0500, Matt Weber wrote:

 >> +define BUSYBOX_NCURSE_PROGS_TWEAKS

 > I've changed the name of this variable to:

 > 	BUSYBOX_DISABLE_NCURSES_PROGS

 > and applied. Thanks a lot!

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
