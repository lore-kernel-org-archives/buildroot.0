From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 08:50:40 +0100
Subject: [Buildroot] [PATCH v2] rtmpdump: use TARGET_LDFLAGS instead of
 TARGET_CFLAGS for XLDFLAGS
In-Reply-To: <1423591176-27243-1-git-send-email-fabio.porcedda@gmail.com>
References: <1423591176-27243-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150214085040.41b180ee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Tue, 10 Feb 2015 18:59:36 +0100, Fabio Porcedda wrote:
> The XLDFLAGS is for ld related flags so use TARGET_LDFLAGS instead of
> TARGET_CFLAGS, also the TARGET_CFLAGS is already used for XCFLAGS.
> 
> This fix is also needed for supporting the per-package staging directory.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
