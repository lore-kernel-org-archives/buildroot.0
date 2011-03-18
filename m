From: Nataraj S Narayan <nataraj@vaaraahi.com>
Date: Fri, 18 Mar 2011 11:04:59 +0000
Subject: [Buildroot] BR: patching  diff f7abec2d1d1e5... direct
Message-ID: <4D833C5B.4090604@vaaraahi.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I was trying to patch the diff of commit
f7abec2d1d1e52f49f7d95c48165cde8cf41edb6 (patch) by 	Jean-Christophe
PLAGNIOL-VILLARD, in the 'package' dir of buildroot.

I believe I am making some mistake here.

# patch -p1< Makefile.package.in.patch
can't find file to patch at input line 3
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|--- a/package/Makefile.package.in
|+++ b/package/Makefile.package.in
--------------------------
File to patch:
Skip this patch? [y] n
File to patch: Makefile.package.in
patching file Makefile.package.in
patch: **** malformed patch@line 4: define DOWNLOAD_GIT


Plz help me to do this right.


regards

Nataraj
