From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 13:16:47 +0200
Subject: [Buildroot] [PATCH 1/2] Add dependency on bash to gzip for
 runtime
In-Reply-To: <55FE8CE3.4030402@mind.be>
References: <1442501193-6059-1-git-send-email-yba@tkos.co.il>
 <20150917150112.GR11632@tarshish>
 <alpine.DEB.2.02.1509171814510.13941@orcam81.orcam.lan>
 <20150917162003.GT11632@tarshish>
 <alpine.DEB.2.02.1509171922410.13941@orcam81.orcam.lan>
 <20150917192315.6db18115@free-electrons.com>
 <20150917190424.GU11632@tarshish>
 <20150917221546.247fe210@free-electrons.com>
 <alpine.DEB.2.11.1509192310350.1987@tanhuma.tkos.co.il>
 <20150920102240.6e8db4f5@free-electrons.com>
 <55FE8CE3.4030402@mind.be>
Message-ID: <20150920131647.7ab94a04@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Sep 2015 12:39:31 +0200, Arnout Vandecappelle wrote:

> > There's some logic in the skeleton package that guarantees that /bin/sh
> > points to the system shell selected by the user in his configuration.
> > So forcing /bin/sh as the shebang should be fine.
> 
>  Well, if the scripts indeed require Bourne extensions, then possibly ash and
> dash will not work... And I have no idea about zsh either.

I think Baruch said he had tried, and the script were working fine with
the Busybox shell.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
