From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Nov 2018 09:18:07 +0100
Subject: [Buildroot] [PATCH] package/libid3tag: add .pc file and install
 to staging hook
In-Reply-To: <20181105062926.21284-1-joerg.krause@embedded.rocks>
References: <20181105062926.21284-1-joerg.krause@embedded.rocks>
Message-ID: <20181105091807.220a68d5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Nov 2018 07:29:26 +0100, J?rg Krause wrote:
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

This probably needs a non-empty commit log. What is the motivation for
adding a .pc file ? Is it used by some other package in Buildroot ? By
a private application/library ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
