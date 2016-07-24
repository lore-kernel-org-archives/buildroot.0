From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 21:32:36 +0200
Subject: [Buildroot] [PATCH 1/3] docker-containerd: pass -extldflags
 '-static' on when BR2_STATIC_LIBS=y
In-Reply-To: <CA+h8R2rzRGmuV+Lek5c1GTCxeGPetiCStQayDgKBEhn=Y-N06g@mail.gmail.com>
References: <1469371427-25201-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CA+h8R2rzRGmuV+Lek5c1GTCxeGPetiCStQayDgKBEhn=Y-N06g@mail.gmail.com>
Message-ID: <20160724213236.2a328c84@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jul 2016 09:30:37 -0700, Christian Stewart wrote:

> Acknowledged, this series looks OK to me but I will do some runtime
> testing today and get back to you, probably around the same time of my
> next docker-engine series revision.

Thanks. I'll wait for your formal Tested-by then.

> PS: Email look OK now?

Email looks perfect now. This e-mail only has a plain text variant, and
this plain text variant is good.

I generally don't mind when people send plain text + HTML, but in your
case, the plain text variant was terrible :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
