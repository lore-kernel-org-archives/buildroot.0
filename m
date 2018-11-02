From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Nov 2018 21:59:35 +0100
Subject: [Buildroot] [PATCH v2,1/1] libxmlrpc: bump to version 1.43.08
In-Reply-To: <20181031114613.30749-1-fontaine.fabrice@gmail.com>
References: <20181031114613.30749-1-fontaine.fabrice@gmail.com>
Message-ID: <20181102215935.64e5b6d9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Wed, 31 Oct 2018 12:46:13 +0100, Fabrice Fontaine wrote:
> - Remove first patch and pass CC_FOR_BUILD and other variables in
>   LIBXMLRPC_MAKE_OPTS instead of LIBXMLRPC_MAKE_ENV because a similar
>   solution is already in version thanks to
>   https://sourceforge.net/p/xmlrpc-c/code/2905
> - Remove second patch (already in version thanks to
>   https://sourceforge.net/p/xmlrpc-c/code/2908)
> - Remove third path (already in version thanks to
>   https://sourceforge.net/p/xmlrpc-c/code/2909)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Could you try to see if the remaining patch
0001-use-correct-curl-config.patch can be accepted upstream?

Also, did they fix the parallel build issues that until now forced us
to use $(MAKE1) ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
