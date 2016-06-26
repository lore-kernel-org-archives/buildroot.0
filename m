From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 14:53:55 +0200
Subject: [Buildroot] Patchwork cleanup week #24
In-Reply-To: <1466939241.32055.6.camel@embedded.rocks>
References: <20160615220634.67eb8fa9@free-electrons.com>
 <1466939241.32055.6.camel@embedded.rocks>
Message-ID: <20160626145355.7e15fccf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg,

On Sun, 26 Jun 2016 13:07:21 +0200, J?rg Krause wrote:

> > ?8. new package: alsacap
> > ????http://patchwork.ozlabs.org/patch/607045/
> > 
> > ????Isn't there already a tool in alsa-utils that does the same thing
> > ????more or less?  
> 
> I guess you mean 'alsa-info' [1]. It's a shell script which does not
> run within Busybox.
> 
> [1]?http://www.alsa-project.org/alsa-info.sh

OK, so packaging alsacap makes sense, thanks for checking.

Would you volunteer to adopt this patch and send an updated version
that fixes the various comments that have been made?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
