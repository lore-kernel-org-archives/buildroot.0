From: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Date: Thu,  2 Sep 2010 12:19:29 +0200
Subject: [Buildroot] Missed a bug
In-Reply-To: <1283422191-30926-8-git-send-email-maxime.petazzoni@bulix.org>
References: <1283422191-30926-8-git-send-email-maxime.petazzoni@bulix.org>
Message-ID: <1283422770-31768-1-git-send-email-maxime.petazzoni@bulix.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I let a bug through in this patch, I forgot to rename SPIDER_MODE to DL_MODE in
mpfr.mk. Here's the updated 7th patch.

- Maxime
