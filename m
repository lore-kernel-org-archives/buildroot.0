From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Nov 2018 21:58:40 +0100
Subject: [Buildroot] [PATCH 1/1] libxmlrpc: bump to version 1.43.08
In-Reply-To: <87in1ibaey.fsf@dell.be.48ers.dk>
References: <20181031114142.26274-1-fontaine.fabrice@gmail.com>
 <87in1ibaey.fsf@dell.be.48ers.dk>
Message-ID: <20181102215840.07126e3f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 Oct 2018 12:52:37 +0100, Peter Korsgaard wrote:
> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:  
> 
>  > - Remove first patch and pass CC_FOR_BUILD and other variables in
>  >   LIBXMLRPC_CONF_OPTS instead of LIBXMLRPC_CONF_ENV because a similar
>  >   solution is already in version thanks to
>  >   https://sourceforge.net/p/xmlrpc-c/code/2905
>  > - Remove second patch (already in version thanks to
>  >   https://sourceforge.net/p/xmlrpc-c/code/2908)
>  > - Remove third path (already in version thanks to
>  >   https://sourceforge.net/p/xmlrpc-c/code/2909)
>  > - Add hash for license file  
> 
>  > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>  
> 
> Committed, thanks.

Fabrice had sent a v2 just a few minutes after the v1, and a few
minutes before you merged the v1.

But anyway, they seem to be the same, except for the commit log, so no
big deal.

I'll mark the v2 as Not Applicable in patchwork.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
