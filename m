From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Feb 2019 23:27:54 +0100
Subject: [Buildroot] [PATCH] package/sqlcipher: add OpenSSL 1.1.x
 compatibility
In-Reply-To: <1549454958-648-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Wed, 6 Feb 2019 06:09:18 -0600")
References: <1549454958-648-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87pnryvu39.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > Fixes
 > http://autobuild.buildroot.net/results/5e2/5e2c3178d8a6e11b1af1c37144737097730ba222/

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 > ---
 > Tested using autobuilder failure setup for libopenssl.

 > For libressl the build fails. The sqlcipher pkg version really should
 > be bumped before investigating the build failure as there are a number
 > of commits that should be picked up.
 > Currently the pkg build won't pass the configure stage.
 > Should I open a bug for this or send something for "next"?

What do we do about the libressl issue for 2019.02? Just select
BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL?

-- 
Bye, Peter Korsgaard
