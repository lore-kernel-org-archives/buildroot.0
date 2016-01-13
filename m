From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Jan 2016 09:17:26 +0100
Subject: [Buildroot] [PATCH] rabbitmq-c: needs a toolchain with
 posix_spawn support
In-Reply-To: <CACt6We3dS-9LNNTMkUNu2vmBdSkJYri6g6X0g2No-D61GRmq4g@mail.gmail.com>
References: <1452516753-1555-1-git-send-email-joris.lijssens@gmail.com>
 <20160112213943.60b8fc12@free-electrons.com>
 <20160112205052.GB3463@free.fr>
 <CACt6We3dS-9LNNTMkUNu2vmBdSkJYri6g6X0g2No-D61GRmq4g@mail.gmail.com>
Message-ID: <20160113091726.62ed0d01@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Joris Lijssens,

On Wed, 13 Jan 2016 08:56:33 +0100, Joris Lijssens wrote:

> So I will send a new patch excluding the blackfin. are there still other
> configurations that use an ancient uClibc without spawn support, or is the
> blackfin the only one?

As far as I remember, Blackfin is the only one.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
