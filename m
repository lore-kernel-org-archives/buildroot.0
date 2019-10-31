From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 11:28:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/gvfs: fix static build with
 libarchive
In-Reply-To: <20191027073317.27107-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 27 Oct 2019 08:33:17 +0100")
References: <20191027073317.27107-1-fontaine.fabrice@gmail.com>
Message-ID: <87mudhxl7m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Use pkg-config to retrieve static dependencies of libarchive in gvfs.mk
 > instead of patching configure.ac as upstream switched to meson

 > Fixes:
 >  - http://autobuild.buildroot.org/results/486187bb7b8800f44a8c173af518b84e68e53584

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
