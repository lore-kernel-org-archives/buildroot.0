From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 21:56:58 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/brltty: avoid spurious log
 messages while decoding scancodes
In-Reply-To: <20171229140641.13882-1-mlang@blind.guru>
References: <20171229140641.13882-1-mlang@blind.guru>
Message-ID: <20171229215658.5f288a24@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Dec 2017 15:06:40 +0100, Mario Lang wrote:

> +++ b/package/brltty/5.5/0001-Prevent-scancodes-from-generating-spurious-log-messa.patch

This patch shouldn't have been in the 5.5/ sub-folder. Indeed, using
per-version sub-directories for patches is only useful for packages
that support multiple versions, which isn't the case of brltty.

So I've moved the patch in package/brltty/ and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
