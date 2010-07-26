From: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Date: Mon, 26 Jul 2010 19:32:39 +0200
Subject: [Buildroot] [PATCH 4/6] Implement basic non-wget download
 methods
In-Reply-To: <1280164454.22687.6.camel@dubciaranr1.verifone.com>
References: <1279625588-26570-1-git-send-email-maxime.petazzoni@bulix.org>
	<1279625588-26570-5-git-send-email-maxime.petazzoni@bulix.org>
	<1280164454.22687.6.camel@dubciaranr1.verifone.com>
Message-ID: <20100726173239.GJ21488@bulix.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Quotient Remainder <quotientvremainder@gmail.com> [2010-07-26 18:14:14]:

> Maxime, if I'm reading this right, the package source archive gets
> created in the downloaded directory $($(PKG)_DL_DIR) instead of
> $(DL_DIR) and so gets removed as soon as it's created by the "rm
> -rf ...".
> The following patch to your patch may be needed.

Nice catch! I'll fix my patch series.

It seems this won't get into 2010.08 anyway, so I'll have the time to
work on the spider/source-check/external-deps features for the next
release too.

Thanks,
- Maxime
-- 
Maxime Petazzoni <http://www.bulix.org>
 ``One by one, the penguins took away my sanity.''
Linux kernel and software developer at MontaVista Software
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 198 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100726/d97915b7/attachment.pgp>
