From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 21:33:01 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/rabbitmq-server: clean up
 license list
In-Reply-To: <20200213151414.25831-1-frank.vanbever@essensium.com>
References: <20200204100733.22106-3-frank.vanbever@essensium.com>
 <20200213151414.25831-1-frank.vanbever@essensium.com>
Message-ID: <20200412213301.6e669511@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Frank,

Sorry for the long delay.

On Thu, 13 Feb 2020 16:14:13 +0100
Frank Vanbever <frank.vanbever@essensium.com> wrote:

> +RABBITMQ_SERVER_LICENSE_FILES =

There was a missing backslash at the end of this line. I fixed that up,
and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
