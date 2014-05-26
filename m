From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 May 2014 22:13:12 +0200
Subject: [Buildroot] [PATCH v3] libnss: Enable for MIPS64 n32 platforms
In-Reply-To: <1400761846-36033-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Thu, 22 May 2014 13:30:46 +0100")
References: <1400761846-36033-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <878upofgdj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > After talking with upstream we concluded that MIPS64 n32 is treated as a
 > 32-bit architecture by libnss because it has 32-bit pointers, so
 > USE_64=1 should not be set in that case.

 > Upstream bug:
 >    https://bugzilla.mozilla.org/show_bug.cgi?id=1010730

 > WRT:
 >    http://git.buildroot.net/buildroot/commit/?id=73e6ae0fe6a69f88183ae33401f2314088b5f799

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
