From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 11 Sep 2011 22:46:17 +0200
Subject: [Buildroot] [PATCH 3/3] samba: make installation of smbd
	configurable
In-Reply-To: <1312235176-31058-4-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Mon, 1 Aug 2011 23:46:16 +0200")
References: <1312235176-31058-1-git-send-email-s.neumann@raumfeld.com>
 <1312235176-31058-4-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87ty8ierja.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> It may be desirable to compile samba but not actually install
 Sven> the smbd binary. This is the case if you need libsmbclient but
 Sven> don't want to run a samba server.

 Sven> Make this possible by allowing to disable installation of smbd.

Committed, thanks.

-- 
Bye, Peter Korsgaard
