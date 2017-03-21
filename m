From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Mar 2017 17:36:16 +0100
Subject: [Buildroot] [PATCH] poppler: bump version to 0.53.0
In-Reply-To: <20170321154109.1311-1-Vincent.Riera@imgtec.com> (Vicente Olivert
 Riera's message of "Tue, 21 Mar 2017 15:41:09 +0000")
References: <20170321154109.1311-1-Vincent.Riera@imgtec.com>
Message-ID: <87h92mlh8f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

I see from the release notes that it now uses C++11 mode, so we might
need to add a dependency on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7, but lets see
what the autobuilders say.

-- 
Bye, Peter Korsgaard
