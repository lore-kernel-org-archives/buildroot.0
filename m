From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 23:14:38 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
In-Reply-To: <4650b5d9-1aa5-56e8-072d-df9af792d02b@mind.be> (Arnout
 Vandecappelle's message of "Mon, 26 Apr 2021 21:50:24 +0200")
References: <20210314233231.351fce1c@windsurf.home>
 <20210317163459.1916948-1-giulio.benetti@benettiengineering.com>
 <4650b5d9-1aa5-56e8-072d-df9af792d02b@mind.be>
Message-ID: <87pmygeojl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 17/03/2021 17:34, Giulio Benetti wrote:
 >> On Nios II binutils it still present ld bug 27597 leading to a package
 >> libgeos to fail building:
 >> http://autobuild.buildroot.net/results/a05fdf1958f93a206c5c66c7f636b6650683626d/http://autobuild.buildroot.net/results/c05/c053b9e191b31f0b1f8f8c902b602e187f714dc0/
 >> 
 >> The bug was already reported and it's been updated:
 >> https://sourceware.org/bugzilla/show_bug.cgi?id=27597
 >> 
 >> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
