From: Christian Stewart <christian@paral.in>
Date: Sun, 24 Jul 2016 12:37:46 -0700
Subject: [Buildroot] [PATCH] package/go: needs PIE support
In-Reply-To: <1469374783-22190-1-git-send-email-romain.naour@gmail.com>
References: <1469374783-22190-1-git-send-email-romain.naour@gmail.com>
Message-ID: <CA+h8R2oso7gyqdvUMA3NYDbw9joD-ju16QDXRpaQ4F-AeUvOLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Sun, Jul 24, 2016 at 8:39 AM, Romain Naour <romain.naour@gmail.com> wrote:
> When build statically, runc try to link against Scrt1.o which is not
> provided by uClibc ARM toolchain for static build only.

Works fine, tested on aarch64, arm, and x86-64.

Tested-by: Christian Stewart <christian@paral.in>

Best,
Christian
