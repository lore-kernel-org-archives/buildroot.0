From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Feb 2021 17:49:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/guile: link with libatomic if
 needed
In-Reply-To: <20210208064626.3516076-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 8 Feb 2021 07:46:26 +0100")
References: <20210208064626.3516076-1-fontaine.fabrice@gmail.com>
Message-ID: <87tuqebnng.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix build of guile 3.0.4 with Bootlin SPARC uclibc toolchain added with
 > commit 1348c569d0cb7f67eca30f170b782aa8b51cc259

 > Fixes:
 >  - http://autobuild.buildroot.org/results/a72d8e14854f9c6c9632e856019a3eb8ec4818b6

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
