From: Christian Stewart <christian@paral.in>
Date: Sun, 24 Jul 2016 12:37:01 -0700
Subject: [Buildroot] [PATCH 2/3] flannel: pass -extldflags '-static' on
	when BR2_STATIC_LIBS=y
In-Reply-To: <1469371427-25201-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1469371427-25201-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1469371427-25201-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CA+h8R2p0TC3MOU=UNGsF0=9KihT0GtOm_fnz9e=5EAKfu1UEpA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Works fine, tested on aarch64, arm, and x86-64.

Tested-by: Christian Stewart <christian@paral.in>

On Sun, Jul 24, 2016 at 7:43 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> There is no reason to link Go binaries statically, unless when
> BR2_STATIC_LIBS=y.

Best,
Christian
