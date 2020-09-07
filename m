From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Mon, 7 Sep 2020 11:47:59 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-09-06
In-Reply-To: <20200907070901.69C16870AE@hemlock.osuosl.org>
References: <20200907070901.69C16870AE@hemlock.osuosl.org>
Message-ID: <45c5b4b3-a11a-1ec3-2f7b-c8abf229b06f@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/09/2020 09:08, Thomas Petazzoni wrote:>
libgit2 | CVE-2014-9390    |
https://security-tracker.debian.org/tracker/CVE-2014-9390
So libgit2 is affected by a 6 year old security vulnerability that has
been fixed before the package was actually introduced in buildroot...

This apparently comes directly from the nvd database, do i wait for it
to be fixed, or should i add it to LIBGIT2_IGNORE_CVES ? The manual
doesn't say anything about this case.
