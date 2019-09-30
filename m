From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 22:18:15 +0200
Subject: [Buildroot] [PATCH] package/libkrb5: Bumb to 1.17
In-Reply-To: <20190930113931.9654-1-nerv@dawncrow.de>
References: <20190930113931.9654-1-nerv@dawncrow.de>
Message-ID: <20190930221815.6d06ffcb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Sep 2019 13:39:31 +0200
Andr? Hentschel <nerv@dawncrow.de> wrote:

> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>

Typo in the commit title: Bumb -> Bump. Also, you should have explained
in the commit log why the hash of the NOTICE file has changed, and what
are the changes. Indeed, this is important to check what license
changes happened. In this case, nothing was really relevant. I've
applied after extending the commit log.

However, I think this package license information may not be totally
correct, independently of this version bump. Indeed, our libkrb5.mk
says the license is MIT, but the NOTICE file shows a bunch of parts
under BSD-2-Clause for example.

Arnout, Yann, what do you think about this? It's one of those packages
with lots of code re-used from different projects, all under
MIT/BSD-2-Clause style licenses. I'd be interested to hear your opinion
on the matter.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
