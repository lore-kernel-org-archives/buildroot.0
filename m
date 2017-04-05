From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Apr 2017 16:29:53 +0200
Subject: [Buildroot] [PATCH 2/4] cracklib: New package
In-Reply-To: <1491396001.3239.1.camel@spectralink.com>
References: <20170209134558.3723-1-stefan.sorensen@spectralink.com>
 <20170209134558.3723-2-stefan.sorensen@spectralink.com>
 <20170401231523.70524b90@free-electrons.com>
 <1491396001.3239.1.camel@spectralink.com>
Message-ID: <20170405162953.3619c506@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 5 Apr 2017 12:40:02 +0000, S?rensen, Stefan wrote:

> > Could you have a look into this, and submit an updated version that
> > fixes this issue?  
> 
> I am not able to reproduce this, though I just notices that it uses the
>  cracklib tools from the PATH, not the ones built in host-cracklib, so
> maybe that is what is causing the issue.

I'm not sure it's the problem, because I'm pretty sure I ran the
command manually by explicitly calling the tools built in
output/host/usr/bin.

But anyway, I'll test your next iteration, and see if I can still
reproduce the issue.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
