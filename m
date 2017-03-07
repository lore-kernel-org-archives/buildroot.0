From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Mar 2017 13:25:49 +0100
Subject: [Buildroot] [PATCH 1/2] Revert "package/libplatform: bump
	version to 2.1.0"
In-Reply-To: <20170306211543.6a601e2a@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 6 Mar 2017 21:15:43 +0100")
References: <20170306181200.381-1-bernd.kuhls@t-online.de>
 <20170306211543.6a601e2a@free-electrons.com>
Message-ID: <87lgshe0j6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Mon,  6 Mar 2017 19:11:59 +0100, Bernd Kuhls wrote:
 >> This reverts commit 2ac3045453d701b1fbea0d04333642a76fbfecc4.
 >> 
 >> This commit was part of the Kodi 17 series and was committed too early,
 >> current Kodi 16 is incompatible with this bump and needs to be
 >> reverted, fixes https://bugs.busybox.net/show_bug.cgi?id=9711
 >> 
 >> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 >> ---
 >> .../0001-p8-platform-config-fix-lookup-paths.patch | 38 --------------------
 >> ...nfig.cmake-fix-paths-for-cross-compilatio.patch | 40 ++++++++++++++++++++++
 >> package/libplatform/libplatform.hash               |  2 +-
 >> package/libplatform/libplatform.mk                 |  8 ++---
 >> 4 files changed, 45 insertions(+), 43 deletions(-)
 >> delete mode 100644 package/libplatform/0001-p8-platform-config-fix-lookup-paths.patch
 >> create mode 100644 package/libplatform/0001-platform-config.cmake-fix-paths-for-cross-compilatio.patch

 > Thanks, both commits applied. Perhaps we need to apply them to the LTS
 > version of Buildroot as well?

Yes - Committed both to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
