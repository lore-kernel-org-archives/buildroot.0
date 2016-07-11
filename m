From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jul 2016 00:28:30 +0200
Subject: [Buildroot] [PATCH 2/2] uboot-tools: bump to version 2016.07
In-Reply-To: <1468269786-23212-2-git-send-email-festevam@gmail.com> (Fabio
 Estevam's message of "Mon, 11 Jul 2016 17:43:06 -0300")
References: <1468269786-23212-1-git-send-email-festevam@gmail.com>
 <1468269786-23212-2-git-send-email-festevam@gmail.com>
Message-ID: <877fcr95dd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:

 > Signed-off-by: Fabio Estevam <festevam@gmail.com>
 > ---
 >  package/uboot-tools/uboot-tools.hash | 2 +-
 >  package/uboot-tools/uboot-tools.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

Did you test this? The patches don't even apply:

Applying 0003-Make-FIT-support-really-optional.patch using patch:
patching file common/bootm.c
Hunk #1 succeeded at 901 (offset 10 lines).
Hunk #2 succeeded at 966 (offset 10 lines).
patching file include/bootm.h
patching file tools/Makefile
Hunk #2 FAILED at 69.
1 out of 2 hunks FAILED -- saving rejects to file tools/Makefile.rej
package/pkg-generic.mk:165: recipe for target '/home/peko/source/buildroot/output-htop/build/host-uboot-tools-2016.07/.stamp_patched' failed

-- 
Bye, Peter Korsgaard
