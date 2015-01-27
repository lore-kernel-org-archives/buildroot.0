From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Jan 2015 23:10:08 +0100
Subject: [Buildroot] [PATCH] alsa-utils: remove -ldl in static builds
In-Reply-To: <fde55ad7b3840dad27b2669844c36d52a55ed79a.1422381099.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 27 Jan 2015 19:51:39 +0200")
References: <fde55ad7b3840dad27b2669844c36d52a55ed79a.1422381099.git.baruch@tkos.co.il>
Message-ID: <87bnljyiwv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Since commit ffd7a00aef723 (alsa-lib: add patch to remove hardcoded -ldl) we
 > patch alsa.m4 from alsa-lib to remove -ldl on static builds. autoreconf
 > alsa-utils to regenerate aclocal.m4 using our alsa.m4.

 > We also need to gettextize alsa-utils because we use a more recent gettext
 > version.

 > Fixes:
 > http://autobuild.buildroot.net/results/314/314dac9f5e62ae9beb598eb1b4cb35c0a7bfe792/
 > http://autobuild.buildroot.net/results/964/964e44f0c1653370600c7e8c647abda3f6380e34/
 > http://autobuild.buildroot.net/results/d72/d72f31bab907c7485d03db4597d01fd759277db4/
 > ...

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
