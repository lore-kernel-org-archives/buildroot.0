From: Hebbar <gururajakr@sanyo.co.in>
Date: Wed, 23 Apr 2008 19:12:17 -0700 (PDT)
Subject: [Buildroot]  Need help using makefile.autotools.in
Message-ID: <16835545.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all,

   I am trying to modify pcmanfm.mk file inorder to override default make
install command. present make install in autotools doesnt run make
install-data required by pcmanfm package to install data file to root/
directory.

I checked makefile.autotools.in file and found that if we use
FOO_TARGET_INSTALL_TARGET or FOO_TARGET_INSTALL_STAGING or
$(FOO_TARGET_INSTALL) we can run custom install but i am not able to
implement the same in pcmanfm package. 

can some one help me to run custom install command inside package.mk files
using autotools method.

Thanks in advance

Regards
Gururaja
-- 
View this message in context: http://www.nabble.com/Need-help-using-makefile.autotools.in-tp16835545p16835545.html
Sent from the BuildRoot mailing list archive at Nabble.com.
