From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 25 Jul 2009 09:14:44 +0200
Subject: [Buildroot] [pull request] Pull request for branch xorg
In-Reply-To: <cover.1248471011.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Fri\,
	24 Jul 2009 23\:30\:01 +0200")
References: <cover.1248471011.git.thomas.petazzoni@free-electrons.com>
Message-ID: <871vo59qu3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The following changes since commit f917e6b21b262b6fb7ff363f6c7b217bb653d97c:
 Thomas>   Peter Korsgaard (1):
 Thomas>         toolchain/gcc: bump 4.4.x version

 Thomas> are available in the git repository at:

 Thomas>   git://git.busybox.net/~tpetazzoni/git/buildroot xorg

 Thomas> Thomas Petazzoni (13):
 Thomas>       xorg: reorganize the selection of the X.org server type
 Thomas>       xorg: reindent configuration option details
 Thomas>       xorg: remove useless configuration comment
 Thomas>       xorg: simplify dependencies on X.org
 Thomas>       midori: remove configuration comment on X.org dependency
 Thomas>       dillo: use select for library dependencies
 Thomas>       matchbox: fix dependencies
 Thomas>       xorg server: beautify list of dependencies
 Thomas>       xorg server: remove dependencies
 Thomas>       xorg: remove reference to non-existing BR2_PACKAGE_XSERVER_none
 Thomas>       xorg: use BR2_PACKAGE_XORG instead of BR2_PACKAGE_XSERVER_none
 Thomas>       xorg: remove references to non-existing configuration options
 Thomas>       xorg: remove the XSERVER variable

Pulled and pushed - Thanks!

-- 
Bye, Peter Korsgaard
