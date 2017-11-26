From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 22:41:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.6.10
In-Reply-To: <20171115221654.5ddaeff4@windsurf.lan> (Thomas Petazzoni's
 message of "Wed, 15 Nov 2017 22:16:54 +0100")
References: <20171115201101.16575-1-bernd.kuhls@t-online.de>
 <20171115221654.5ddaeff4@windsurf.lan>
Message-ID: <87shd0d8fh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Wed, 15 Nov 2017 21:11:01 +0100, Bernd Kuhls wrote:
 >> Quoting release notes
 >> https://www.samba.org/samba/history/samba-4.6.10.html
 >> 
 >> "This is an additional bugfix release to address a possible data
 >> corruption issue. Please update immediately! For details, please see
 >> 
 >> https://bugzilla.samba.org/show_bug.cgi?id=13130
 >> 
 >> Samba 4.6.0 and newer is affected by this issue."
 >> 
 >> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 >> ---
 >> package/samba4/samba4.hash | 2 +-
 >> package/samba4/samba4.mk   | 2 +-
 >> 2 files changed, 2 insertions(+), 2 deletions(-)

 > Since this is clearly a bug fix release, which includes a fix for a
 > major bug, I've applied to master.

 > Peter: it should go to 2017.08.x as well (which uses 4.6.8). 2017.02.x
 > uses 4.5.5, which apparently is not affected by the problem.

Indeed - Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
