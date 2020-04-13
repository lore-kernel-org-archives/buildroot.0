From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 21:21:32 +0200
Subject: [Buildroot] [PATCH] package/libsoundtouch: bump to version 2.1.2
In-Reply-To: <1569750166-6261-1-git-send-email-gilles.talis@gmail.com>
References: <1569750166-6261-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <20200413212132.5fae37f7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Sep 2019 11:42:46 +0200
Gilles Talis <gilles.talis@gmail.com> wrote:

> - Updated download site and download method
> - Added hash for license file
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> ---
>  package/libsoundtouch/libsoundtouch.hash | 5 ++++-
>  package/libsoundtouch/libsoundtouch.mk   | 5 ++---
>  2 files changed, 6 insertions(+), 4 deletions(-)

Applied to master, thanks. Since then, the hash of the license file had
been added, so I reworked your patch to update the hash of the license
file (and explain why it has changed).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
