From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Mar 2017 21:12:38 +0100
Subject: [Buildroot] [PATCH] poppler: bump version to 0.53.0
In-Reply-To: <20170321172243.asedlzsa4ypg3ix3@tarshish> (Baruch Siach's
 message of "Tue, 21 Mar 2017 19:22:43 +0200")
References: <20170321154109.1311-1-Vincent.Riera@imgtec.com>
 <87h92mlh8f.fsf@dell.be.48ers.dk>
 <20170321172243.asedlzsa4ypg3ix3@tarshish>
Message-ID: <87zigejsnd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Tue, Mar 21, 2017 at 05:36:16PM +0100, Peter Korsgaard wrote:
 >> >>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
 >> 
 >> > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 >> 
 >> Committed, thanks.
 >> 
 >> I see from the release notes that it now uses C++11 mode, so we might
 >> need to add a dependency on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7, but lets see
 >> what the autobuilders say.

 > This is not in master as of 1106771a414ede1.

Ups, indeed - It is now.

-- 
Bye, Peter Korsgaard
