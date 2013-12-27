From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 27 Dec 2013 09:48:07 +0200
Subject: [Buildroot] Qt5Webkit build failure
In-Reply-To: <20131225181813.09384b3e@skate>
References: <20131225181813.09384b3e@skate>
Message-ID: <201312270948.07522.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wednesday 25 December 2013 19:18:13 Thomas Petazzoni wrote:
> Seems like it's trying to use FPU instructions on a soft-float
> toolchain.

Upstream has a patch for this issue. I am preparing a patch now.

Thanks.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131227/ef056092/attachment.html>
