From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Jan 2016 22:17:29 +0100
Subject: [Buildroot] [PATCH] procps-ng: install binaries in /bin and
	/sbin
In-Reply-To: <1452701159-22362-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Wed, 13 Jan 2016 16:05:59 +0000")
References: <1452701159-22362-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87egdjzwra.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > This way the busybox counterparts are overwritten and we will not end up
 > with procps-ng binaries in /usr/bin and /usr/sbin, and busybox symlinks
 > for the same tools in /bin and /sbin.

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
