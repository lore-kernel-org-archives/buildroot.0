From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 19:23:14 +0200
Subject: [Buildroot] [PATCH v9 14/15] cpio: new package
In-Reply-To: <20150718191755.52140b53@free-electrons.com>
References: <1436905227-26937-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1436905227-26937-15-git-send-email-clayton.shotwell@rockwellcollins.com>
 <20150718191755.52140b53@free-electrons.com>
Message-ID: <20150718192314.647af187@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Jul 2015 19:17:55 +0200, Thomas Petazzoni wrote:

> On Tue, 14 Jul 2015 15:20:26 -0500, Clayton Shotwell wrote:
> 
> >  package/Config.in           |  1 +
> >  package/Config.in.host      |  1 +
> 
> In the review of v7, we agreed to remove the host option. So I got rid
> of it and applied your patch. Thanks!

Another small nit: cpio requires wchar support, so I fixed that up as
well:

  http://git.buildroot.net/buildroot/commit/?id=6c7d490558498888a783fe3ca53f1a3b6cef1b16

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
