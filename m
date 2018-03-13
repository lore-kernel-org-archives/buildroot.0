From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Mar 2018 09:26:49 +0100
Subject: [Buildroot] [PATCH] trinity: fix build with glibc 2.27
In-Reply-To: <db10ab15ad5fb738d9285674ec767bbe9f58829a.1520925579.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 13 Mar 2018 09:19:39 +0200")
References: <db10ab15ad5fb738d9285674ec767bbe9f58829a.1520925579.git.baruch@tkos.co.il>
Message-ID: <87efkofkja.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > glibc 2.27 added a system call wrapper for memfd_create() which collides
 > with the local definition of the same symbol in trinity. Add a patch to
 > detect the presence of memfd_create(), and avoid collision.

 > Fixes:
 > http://autobuild.buildroot.net/results/fda/fda07327395921fdc79cbb4f24b662209fee1be1/
 > http://autobuild.buildroot.net/results/f98/f98f43657cbf519a626257af5a21c8c228423856/
 > http://autobuild.buildroot.net/results/575/57558c418ea5c5011ac22e5236beff4d823c825b/

 > Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>


Committed, thanks.

-- 
Bye, Peter Korsgaard
