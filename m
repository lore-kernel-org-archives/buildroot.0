From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Jul 2017 22:34:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/joe: bump version to 4.4
In-Reply-To: <1nkk4ex84b.ln2@ID-313208.user.individual.net> (Bernd Kuhls's
 message of "Tue, 25 Jul 2017 22:02:09 +0200")
References: <20170724182544.31732-1-bernd.kuhls@t-online.de>
 <87pocozjr2.fsf@dell.be.48ers.dk>
 <1nkk4ex84b.ln2@ID-313208.user.individual.net>
Message-ID: <87d18oz25p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

Hi,

 > Ah, now I see the difference, BR2_PACKAGE_JOE_FULL has "default y" and 
 > was part of my defconfig. When deactivating BR2_PACKAGE_JOE_FULL I can 
 > reproduce the error, sent v2.

Ok, thanks.

 >> I'm not quite sure why we use a custom install step instead of just make
 >> install. This is what joe installs:

 > "make install" installs everything while custom JOE_INSTALL_TARGET_CMDS 
 > only installs the binary when BR2_PACKAGE_JOE_FULL is disabled.

Ahh yes.

-- 
Bye, Peter Korsgaard
