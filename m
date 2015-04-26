From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 22:25:23 +0200
Subject: [Buildroot] [PATCH v2 6/6] package/perl-mail-spamassassin: new
 package
In-Reply-To: <XnsA488837A5F7C7berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1430041039-13905-1-git-send-email-bernd.kuhls@t-online.de>
 <1430041039-13905-6-git-send-email-bernd.kuhls@t-online.de>
 <20150426120256.63387117@free-electrons.com>
 <XnsA488837A5F7C7berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20150426222523.15bca0d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, Fran?ois,

On Sun, 26 Apr 2015 12:55:29 +0200, Bernd Kuhls wrote:

> > On Sun, 26 Apr 2015 11:37:19 +0200, Bernd Kuhls wrote:
> >> This package contains a dependency check which only checks for installed
> >> modules in host-perl, not the target variant. Therefore some host package
> >> of perl modules are needed as dependency.
> > 
> > What about fixing Spamassassin instead?
> 
> Hi Thomas,
> 
> I tried and failed:
> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/114369

Argh. Fran?ois, maybe you can help on this by having a look?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
