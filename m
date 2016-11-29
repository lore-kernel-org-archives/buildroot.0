From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Nov 2016 22:51:14 +0100
Subject: [Buildroot] [git commit] Update for 2016.11-rc3
In-Reply-To: <CAB0FRstpY7bqyGTp6zCaPm9Y7ADsGd3+p5Qk4JOJoLghWb+Caw@mail.gmail.com>
 (=?utf-8?Q?=22Fran=C3=A7ois?= Perrad"'s message of "Tue, 29 Nov 2016
 14:31:49 +0100")
References: <20161128225014.295707F8BF@busybox.osuosl.org>
 <CAB0FRstpY7bqyGTp6zCaPm9Y7ADsGd3+p5Qk4JOJoLghWb+Caw@mail.gmail.com>
Message-ID: <87polec5v1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fran?ois" == Fran?ois Perrad <francois.perrad@gadz.org> writes:

 > 2016-11-28 23:48 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:
 >> commit: https://git.buildroot.net/buildroot/commit/?id=93106e9e1fd2f722b92e3da9a0e6cc9a5a379cb2
 >> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> CHANGES                    | 30 ++++++++++++++++++++++++++++++
 >> Makefile                   |  2 +-
 >> docs/website/download.html | 18 +++++++++---------
 >> docs/website/news.html     | 22 ++++++++++++++++++++++
 >> 4 files changed, 62 insertions(+), 10 deletions(-)
 >> 
 >> diff --git a/CHANGES b/CHANGES
 >> index c4c063c..ddbb017 100644
 >> --- a/CHANGES
 >> +++ b/CHANGES
 >> @@ -1,3 +1,33 @@
 >> +2016.11-rc3, Released November 28th, 2016
 >> +
 >> +       Fixes all over the tree, including a number of security fixes.
 >> +
 >> +       The move from fakeroot to pseudo unfortunately brought a
 >> +       number of issues.  The SELinux issue described in #9386 which
 >> +       triggered the move to pseudo has been investigated further and
 >> +       a workaround implemented and the pseudo changes reverted.
 >> +
 >> +       Linux kernel: update default to 4.8.11.
 >> +
 >> +       Defconfigs: Updates/fixes for imx28ek, mx6udoo, imx6ulpico,
 >> +       olimex a20 olinuxino lime malo, roseapplepi, synopsis aarch64

 > typo s/malo/mali/

Ups, fixed - Thanks!

-- 
Bye, Peter Korsgaard
