From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Nov 2017 21:25:45 +0100
Subject: [Buildroot] [PATCH 2/4 v3] package/freerdp: optional systemd's
 journald support
In-Reply-To: <7a50d6a13cc101e92bbcb3af45310421415af9a5.1510474387.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 12 Nov 2017 09:13:24 +0100")
References: <cover.1510474387.git.yann.morin.1998@free.fr>
 <7a50d6a13cc101e92bbcb3af45310421415af9a5.1510474387.git.yann.morin.1998@free.fr>
Message-ID: <87tvxy3oza.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > FreeRDP now has support for writing to the journal, so we must ensure
 > proper dependency and correct options.

 > Partially fixes:
 >     http://autobuild.buildroot.org/results/81aa66ddd88919295ccb5f34b527b737627263a7/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 > ---
 > Changes v1 -> v2:
 >   - fix typo in BR2_PACAKGE_SYSTEMD  (Arnout)

Committed, thanks.

-- 
Bye, Peter Korsgaard
