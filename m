From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Wed, 6 Nov 2013 08:23:03 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-11-05
In-Reply-To: <20131106073025.DACCA52C609@lolut.humanoidz.org>
References: <20131106073025.DACCA52C609@lolut.humanoidz.org>
Message-ID: <5279FC67.3050706@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/06/2013 07:30 AM, Thomas Petazzoni wrote:
>    mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/6dfe7b0d0a2e3c64743755d58729522d24948f1f/

This is yet another MIPS64/n64 failure. This is a libtool problem and 
has been fixed in the upstream libtool.

http://git.savannah.gnu.org/cgit/libtool.git/commit/?id=5f7f7d9615bf650cf99d581a33b3e18357f79951

It might take a while for the fix to propagate to packages

-- 
markos
