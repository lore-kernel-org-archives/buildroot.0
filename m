From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 22 Dec 2010 23:47:28 +0100
Subject: [Buildroot] [git commit master 1/1] vim: convert to autotargets,
	bump to version 7.2.446
Message-ID: <20101222232248.745218E20B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bb23d22794b2e52bb23da71237bf078f25dacfb9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Convert to autotargets package.
* Bump to version 7.2.446.

We fetch from svn to avoid having a ton of patch files.

This won't do us any good if we want vim 7.3 since the repository was
moved to mercurial. However 7.3 still has some cross-compile issues.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Patch is too large, so refusing to show it
