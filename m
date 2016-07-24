From: Christian Stewart <christian@paral.in>
Date: Sun, 24 Jul 2016 12:36:19 -0700
Subject: [Buildroot] [PATCH 1/3] docker-containerd: pass -extldflags
	'-static' on when BR2_STATIC_LIBS=y
In-Reply-To: <20160724213236.2a328c84@free-electrons.com>
References: <1469371427-25201-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CA+h8R2rzRGmuV+Lek5c1GTCxeGPetiCStQayDgKBEhn=Y-N06g@mail.gmail.com>
 <20160724213236.2a328c84@free-electrons.com>
Message-ID: <CA+h8R2pZc5q5ys72NZVERTB5bCOmdySieAaChnWYQc72wKtnJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sun, Jul 24, 2016 at 12:32 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Thanks. I'll wait for your formal Tested-by then.

Works fine, runtime-tested on aarch64, arm, and x86-64.

Tested-by: Christian Stewart <christian@paral.in>

Best,
Christian

> Email looks perfect now. This e-mail only has a plain text variant, and
> this plain text variant is good.

Great. I just forced gmail into plain text mode.
