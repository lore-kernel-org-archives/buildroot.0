From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 May 2013 12:54:22 +0200
Subject: [Buildroot] [PATCH 13/20] cubieboard: add support
In-Reply-To: <1369606110-8088-14-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 27 May 2013 00:08:23 +0200")
References: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1369606110-8088-14-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87txlm6opt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> From: Carlo Caione <carlo.caione@gmail.com>
 Thomas> Signed-off-by: Carlo Caione <carlo.caione@gmail.com>
 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  board/cubietech/cubieboard/boot.cmd       |    4 +
 Thomas>  board/cubietech/cubieboard/mkcubiecard.sh |  119 +++++++++++++++++++++++++++++
 Thomas>  board/cubietech/cubieboard/post-build.sh  |   15 ++++
 Thomas>  board/cubietech/cubieboard/readme.txt     |   59 ++++++++++++++
 Thomas>  configs/cubieboard_defconfig              |   39 ++++++++++
 Thomas>  5 files changed, 236 insertions(+)
 Thomas>  create mode 100644 board/cubietech/cubieboard/boot.cmd
 Thomas>  create mode 100755 board/cubietech/cubieboard/mkcubiecard.sh
 Thomas>  create mode 100755 board/cubietech/cubieboard/post-build.sh
 Thomas>  create mode 100644 board/cubietech/cubieboard/readme.txt
 Thomas>  create mode 100644 configs/cubieboard_defconfig

Committed to next with the defconfig adjusted for the _FEX_FILE change,
thanks.

-- 
Bye, Peter Korsgaard
