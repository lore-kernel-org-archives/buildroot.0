From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Dec 2014 13:38:07 +0100
Subject: [Buildroot] [PATCH] xserver_xorg-server: libunwind support is
	broken on MIPS64 n32
In-Reply-To: <1417436666-54652-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Mon, 1 Dec 2014 12:24:26 +0000")
References: <1417436666-54652-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87egsjh7f4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Amend the former commit and disable xorg-server with libunwind support
 > only for MIPS64 n32, as stated in the bug report:

 > https://bugs.freedesktop.org/show_bug.cgi?id=79939

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
