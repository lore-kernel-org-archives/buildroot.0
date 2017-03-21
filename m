From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Mar 2017 17:34:23 +0100
Subject: [Buildroot] [PATCH] memcached: bump version to 1.4.36
In-Reply-To: <20170321154008.813-1-Vincent.Riera@imgtec.com> (Vicente Olivert
 Riera's message of "Tue, 21 Mar 2017 15:40:08 +0000")
References: <20170321154008.813-1-Vincent.Riera@imgtec.com>
Message-ID: <87lgrylhbk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed after updating the commit message with a link to the release
notes and mentioning that this release fixes an important issue (making
it a candidate for 2017.02.x backport), thanks.

Important bug fix that could lead to a hung slab mover. Also improves
memory efficiency of chunked items.

-- 
Bye, Peter Korsgaard
