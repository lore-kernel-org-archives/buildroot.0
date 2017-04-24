From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 21:24:11 +0200
Subject: [Buildroot] [PATCH 1/5] package/mplayer: fix musl build error
In-Reply-To: <20170412225235.20962aaa@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 12 Apr 2017 22:52:35 +0200")
References: <20170410204122.13382-1-bernd.kuhls@t-online.de>
 <20170412225235.20962aaa@free-electrons.com>
Message-ID: <87inltwqw4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Mon, 10 Apr 2017 22:41:18 +0200, Bernd Kuhls wrote:
 >> Fixes
 >> http://autobuild.buildroot.net/results/08e/08ed316677f519c8005928366aea89570527a033/
 >> 
 >> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 >> ---
 >> package/mplayer/0006-musl-ldt.patch | 22 ++++++++++++++++++++++
 >> 1 file changed, 22 insertions(+)
 >> create mode 100644 package/mplayer/0006-musl-ldt.patch

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
