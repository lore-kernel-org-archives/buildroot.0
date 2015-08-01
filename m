From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sat, 01 Aug 2015 08:40:45 +0200
Subject: [Buildroot] [PATCH v8 1/1] package/swupdate: new package
In-Reply-To: <55BBEF85.4000207@openwide.fr>
References: <1438375543-28208-1-git-send-email-joerg.krause@embedded.rocks>
 <55BBEF85.4000207@openwide.fr>
Message-ID: <1438411245.3049.8.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fr, 2015-07-31 at 23:58 +0200, Romain Naour wrote:
> Hi J?rg,
> 
> I enabled CONFIG_UBOOT with a minimal config and I get a link error (
> -lz not found)
> I think it's one of the new commit in 201507 "Build error if U-Boot 
> is required
> without gunzip" cf495e23ad117f4cae9c429e80714fe9c18f2d6a.
> 
> So CONFIG_UBOUT mustn't be available when HAVE_ZLIB=n.

That's right! This has to be fixed upstream.

Best regards
J?rg Krause
