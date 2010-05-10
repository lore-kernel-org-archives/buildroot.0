From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 May 2010 20:23:21 +0200
Subject: [Buildroot] [PATCH] Fix Python version detection for libxcb
In-Reply-To: <20100510133852.26288.87834.stgit@pauliusz>
References: <20100510133852.26288.87834.stgit@pauliusz>
Message-ID: <20100510202321.65f67f29@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 10 May 2010 16:38:53 +0300
Paulius Zaleckas <paulius.zaleckas@gmail.com> wrote:

> Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>

On my system, the Python version was 2.6.4, not just 2.6, so my regexp
was working. But obviously, yours is better, so:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
