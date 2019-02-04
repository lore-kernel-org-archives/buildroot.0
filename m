From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 09:57:07 +0100
Subject: [Buildroot] [PATCH] ncdu: bump to version 1.13
In-Reply-To: <1549198072-2967-1-git-send-email-gilles.talis@gmail.com>
References: <1549198072-2967-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <20190204095707.5994e0e2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

We now like to have commit titles that start with "package/<foo>", so I
fixed that.

On Sun,  3 Feb 2019 13:47:52 +0100
Gilles Talis <gilles.talis@gmail.com> wrote:

> +# computed locally
> +md5 6682a63e3e3e8ea14051d05056a857a0 COPYING

We use sha256 hashes for locally calculated hashes, so I've replaced by
such a hash instead.

Applied with those two changes. Thanks!

Thomas

-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
