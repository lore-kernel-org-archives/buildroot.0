From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Oct 2019 20:55:18 +0200
Subject: [Buildroot] [PATCH 2019.08.x] package/cups-filters: fix ln -r
 workaround for older patch versions
In-Reply-To: <20191018141229.19951-1-unixmania@gmail.com> (unixmania's message
 of "Fri, 18 Oct 2019 11:12:29 -0300")
References: <20191018141229.19951-1-unixmania@gmail.com>
Message-ID: <87k191lw89.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > 0001-install-support-old-ln-versions-without-the-r-option.patch adds a
 > ln-srf script for older distributions to emulate 'ln -r', but GNU patch <
 > 2.7 does not handle the git patch permission extensions - So ensure it is
 > executable.

 > https://savannah.gnu.org/forum/forum.php?forum_id=7361

 > Fixes:
 >     http://autobuild.buildroot.net/results/5c88115b92abc1360a979cd46e00332f61c41cb4

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Carlos Santos <unixmania@gmail.com>

Committed to 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
