From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Jul 2017 18:25:54 +0200
Subject: [Buildroot] [PATCH 2/3] efivar: bump to version 31
In-Reply-To: <20170711161054.qhsr2glldmil6uzt@tarshish>
References: <20170711155957.10815-1-thomas.petazzoni@free-electrons.com>
 <20170711155957.10815-2-thomas.petazzoni@free-electrons.com>
 <20170711161054.qhsr2glldmil6uzt@tarshish>
Message-ID: <20170711182554.7677e18e@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Jul 2017 19:10:54 +0300, Baruch Siach wrote:

> On Tue, Jul 11, 2017 at 05:59:56PM +0200, Thomas Petazzoni wrote:
> > This allows to drop two patches that have been upstreamed:
> > 
> >  0001-Use-z-muldefs-to-avoid-the-multiple-definitions-bug-.patch is
> >  upstream as of commit 18b9b3dd7ebf23a16de07b3fb6ae622be488d712
> > 
> >  0003-Remove-some-extra-const-that-gcc-complains-about.patch is
> >  upstream as of commit 1c7c0f71c9d22efda4156881eb187b8c69d1cca7.  
> 
> Version 31 is marked as pre-release[1], like 29 and 25 before. It seems like 
> only even version numbers are stable releases.

OK, good point, I didn't notice that. So it was really a good idea to
split PATCH 1/3 that adds just the gcc 7.x fix from the rest of the
series.

I'll apply PATCH 1/3 and reject PATCH 2/3 and 3/3. Is that OK for you?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
