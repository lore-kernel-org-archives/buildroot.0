From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 13:35:20 +0100
Subject: [Buildroot] [PATCH] package/pinentry: avoid building qt5
 version if qt4 is enabled
In-Reply-To: <1517204291-23391-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 (Zoltan Gyarmati's message of "Mon, 29 Jan 2018 06:38:11 +0100")
References: <1517204291-23391-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <87372m6waf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Zoltan" == Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com> writes:

 > BR2_PACKAGE_PINENTRY_QT5 selects BR2_PACKAGE_QT5, which can lead to Qt
 > version clash if otherwise Qt4 is selected as well. Making
 > BR2_PACKAGE_PINENTRY_QT5 depending on !BR2_PACKAGE_QT to avoid this.

 > Fixes:
 >      http://autobuild.buildroot.net/results/3c537e1260dc9ce57657ca0d49e318a10aee111e

 > Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
