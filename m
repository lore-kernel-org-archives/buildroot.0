From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 17:03:01 +0200
Subject: [Buildroot] [git commit] linux: config.in: add comment for Arm
 Cortex-M
In-Reply-To: <20180601144051.31A5E7FF2B@busybox.osuosl.org> (Peter Korsgaard's
 message of "Fri, 1 Jun 2018 16:37:48 +0200")
References: <20180601144051.31A5E7FF2B@busybox.osuosl.org>
Message-ID: <87d0wpsbfe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=f13477b68fc228709764262431faf3458c28ccab
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > When binutils > 2.28 are selected on Arm Cortex-M cpu,
 > linux kernel does not boot due to a new implementation
 > of 'adr pseudo instruction' on binutils.

 > Bugzilla thread: https://bugs.busybox.net/show_bug.cgi?id=11051

 > Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
