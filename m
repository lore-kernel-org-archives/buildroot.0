From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Sep 2015 23:58:51 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libyuv: Fix aarch64 support
In-Reply-To: <1441648357-19862-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Mon, 7 Sep 2015 19:52:37 +0200")
References: <1441648357-19862-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87twqy9e1w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > aarch64 is a NEON-enabled arch according to the source code[1] but the
 > files containing the NEON-specific functions[2] were not added to the
 > build using CMake.

 > Fixes
 > http://autobuild.buildroot.net/results/c8d/c8d9bff33484b598ff85a26771ce51295bec550d/
 > http://autobuild.buildroot.net/results/7f3/7f3a09157c4c385434458b6aafec202376e75706/
 > http://autobuild.buildroot.net/results/991/9917d7bb18305c6a6bcbd9fe2aa986d452f7d4a4/
 > http://autobuild.buildroot.net/results/6bf/6bf9e48b53f77b8a7bb8a667ea3f63298a4685ce/
 > http://autobuild.buildroot.net/results/ccf/ccff5d1cb3de8642e3fa24a6b01b31a503df67f9/
 > http://autobuild.buildroot.net/results/0c5/0c559f1b1b9bc9f2e2a131e34f034ce4e34fa75b/
 > http://autobuild.buildroot.net/results/bf3/bf324985e9bbcd61196304de1d0313a0e216a0a8/
 > http://autobuild.buildroot.net/results/d55/d552e5e46c263ff9860192a993ee9ed11d7783a6/
 > http://autobuild.buildroot.net/results/2d7/2d73ccdfd5d06bd6dfdc4e303fe48a554460fa1c/
 > http://autobuild.buildroot.net/results/972/97207ed46a519368e242f0621e4363d522e21ee8/
 > http://autobuild.buildroot.net/results/d84/d84d54d85183296c57c9131d946e4517ddcaa84d/
 > http://autobuild.buildroot.net/results/c18/c189149b8d2a0242da06ec68863db23cd0fa65b8/
 > http://autobuild.buildroot.net/results/73a/73a026644179708692c43166a8ffba3ce0e19d95/

 > [1] https://freeswitch.org/stash/projects/SD/repos/libyuv/browse/include/libyuv/row.h#263
 > [2] https://freeswitch.org/stash/projects/SD/repos/libyuv/browse/BUILD.gn#101

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > v2: Added missing source files for aarch64 to CMake

Committed, thanks.

-- 
Bye, Peter Korsgaard
