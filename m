From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 23:13:14 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/uacme: fix c99 detection on
 !wchar toolchains
In-Reply-To: <20191004132303.uridblmtnvsp2xee@einstein.dilieto.eu>
References: <20191004132303.uridblmtnvsp2xee@einstein.dilieto.eu>
Message-ID: <20191005231314.11ed76f3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 4 Oct 2019 15:23:03 +0200
Nicola Di Lieto <nicola.dilieto@gmail.com> wrote:

> Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>

You forgot to add a reference to the autobuilder failure that it fixes,
so I've added that, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
