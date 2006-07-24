From: Erik Andersen <andersen@codepoet.org>
Date: Mon Jul 24 11:08:05 2006
Subject: [Buildroot] where to put patches for packages?
In-Reply-To: <e03026b75efb187f2e170965e3c460d2@bowery.com>
References: <44C4AD92.7000205@tiscali.de>
	<e03026b75efb187f2e170965e3c460d2@bowery.com>
Message-ID: <20060724180728.GA22730@codepoet.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon Jul 24, 2006 at 01:17:23PM -0400, Marc Lindahl wrote:
> Hi,
> I'm a relative newbie to buildroot... I'm trying to figure out where to 
> put  (non-kernel) patches to packages (e.g. pcmcia-cs)... can someone 
> point it out to me?
> Thx,
> M

Packages have all their associated stuff in the
	package/packagename/
directory.  So for example pcmcia-cs lives under
	package/pcmcia/
and anything matching buildroot/package/pcmcia/pcmcia\*.patch
will be applied when building pcmcia-cs.

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--
