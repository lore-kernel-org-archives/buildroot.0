From: Christian Stewart <christian@paral.in>
Date: Sun, 24 Jul 2016 09:30:37 -0700
Subject: [Buildroot] [PATCH 1/3] docker-containerd: pass -extldflags
	'-static' on when BR2_STATIC_LIBS=y
In-Reply-To: <1469371427-25201-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1469371427-25201-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CA+h8R2rzRGmuV+Lek5c1GTCxeGPetiCStQayDgKBEhn=Y-N06g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sun, Jul 24, 2016 at 7:43 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> There is no reason to link Go binaries statically, unless when
> BR2_STATIC_LIBS=y.

Acknowledged, this series looks OK to me but I will do some runtime
testing today and get back to you, probably around the same time of my
next docker-engine series revision.

Best,
Christian

PS: Email look OK now?
