From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 05 Nov 2018 12:11:23 +0100
Subject: [Buildroot] [PATCH] package/libid3tag: add .pc file and install
 to staging hook
In-Reply-To: <20181105091807.220a68d5@windsurf>
References: <20181105062926.21284-1-joerg.krause@embedded.rocks>
 <20181105091807.220a68d5@windsurf>
Message-ID: <3c60ea6bee5652ec54bd5182982929cbd3b1aa01.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2018-11-05 at 09:18 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon,  5 Nov 2018 07:29:26 +0100, J?rg Krause wrote:
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> 
> This probably needs a non-empty commit log. What is the motivation for
> adding a .pc file ? Is it used by some other package in Buildroot ? By
> a private application/library ?

Sorry for being lazy :-) Thought it is a trivial change...

I am porting the mpd 0.21 release to the meson build system. It uses
pkg-config for detecting libid3tag and fails, because of the missing
.pc file.

Shall I send a v2 with a non-empty commit log?

J?rg
