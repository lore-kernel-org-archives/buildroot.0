From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Sep 2012 15:52:50 +0200
Subject: [Buildroot] [PATCH 3/3] u-boot: add version 2012.07
In-Reply-To: <1346760019-31807-3-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 4 Sep 2012 09:00:19 -0300")
References: <1346760019-31807-1-git-send-email-gustavo@zacarias.com.ar>
 <1346760019-31807-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87d321opxp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  boot/uboot/Config.in                               |    6 +++-
 Gustavo>  ...oot-tools-2012.07-drop-configh-from-tools.patch |   31 ++++++++++++++++++++
 Gustavo>  ...oot-tools-2012.07-hostcflags-override-fix.patch |   29 ++++++++++++++++++
 Gustavo>  3 files changed, 65 insertions(+), 1 deletions(-)
 Gustavo>  create mode 100644 package/uboot-tools/uboot-tools-2012.07-drop-configh-from-tools.patch
 Gustavo>  create mode 100644 package/uboot-tools/uboot-tools-2012.07-hostcflags-override-fix.patch

You don't seem to be removing the 2012.04 patches?

-- 
Bye, Peter Korsgaard
