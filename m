From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Jan 2014 12:43:54 +0100
Subject: [Buildroot] [PATCH v3] libnfc-llcp: rename to libllcp and bump
	version
In-Reply-To: <1389348379-56045-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Fri, 10 Jan 2014 10:06:19 +0000")
References: <1389348379-56045-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87eh4c14zp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > This package has been renamed upstream to libllcp. Also, the current
 > package we have in Buildroot fails to compile due to a version bump of
 > it's main dependence, libnfc. A version bump is required because this
 > package has been adapted upstream to work with libnfc-1.7.0-rc6.

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
