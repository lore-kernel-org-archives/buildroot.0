From: Sven Neumann <s.neumann@phase-zero.de>
Date: Fri, 16 Jan 2009 10:32:37 +0100
Subject: [Buildroot] error building alsa-utils
In-Reply-To: <1232051621.4757.26.camel@aeglos.sweden.atmel.com>
References: <496E4A36.4050902@carallon.com>
	<8763khbnec.fsf@macbook.be.48ers.dk>  <496F1A63.3010403@carallon.com>
	<1232051621.4757.26.camel@aeglos.sweden.atmel.com>
Message-ID: <1232098357.6639.4.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, 2009-01-15 at 21:33 +0100, Ulf Samuelsson wrote:
> tor 2009-01-15 klockan 11:13 +0000 skrev Will Wagner:
> > > 
> > > Ah yes, thats fairly common. Please send the patch to the list and
> > > I'll apply it - Also don't forget to send it to the alsa people!
> > 
> > Attached is patch, have also mailed alsa-devel
> > 
> Alsa-utils fails for me when I run buildall.sh so 
> I will put the stuff in the alsa-utils directory and rerun.

We have tested the patch that Will sent to the list. It seems to work
fine and we are now able to build without the legacy functions and
macros in uclibc. I suggest that the patch is included in buildroot.


Sven
