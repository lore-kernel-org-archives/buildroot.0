From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 15 Jun 2015 09:38:06 +0200
Subject: [Buildroot] [PATCH 1/4] package/nodejs: Update to allow
 selecting node.js version
In-Reply-To: <20150614225309.07f354ed@free-electrons.com>
References: <1434298376-31893-1-git-send-email-martin@barkynet.com>
 <20150614225309.07f354ed@free-electrons.com>
Message-ID: <1434353886.5045.4.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On So, 2015-06-14 at 22:53 +0200, Thomas Petazzoni wrote:
> Dear Martin Bark,
> 
> On Sun, 14 Jun 2015 17:12:53 +0100, Martin Bark wrote:
> > Signed-off-by: Martin Bark <martin@barkynet.com>
> 
> What is the motivation for supporting more than one version of NodeJS
> at a time?

Nodejs 0.10 and 0.12 use different versions of the V8 engine. The V8
version used in 0.12 unfortunatly dropped support for the ARMv5
architecture.

> We generally try to avoid supporting multiple versions of a given
> component, unless there are some really good reasons to do so (like
> python2 vs. python3, or qt4 vs. qt5).

Nodejs 0.10 is still maintaned and new versions will follow. I would
suggest to support both version until maintenance is dropped.

Best regards
J?rg Krause
