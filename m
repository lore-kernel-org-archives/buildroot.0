From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 16 Feb 2015 12:13:30 +0100
Subject: [Buildroot] [PATCH 1/1] make clean : also remove graphs.
In-Reply-To: <20150215215529.077ac17c@free-electrons.com>
References: <1424016172-659-1-git-send-email-sagaert.johan@skynet.be>
 <20150215215529.077ac17c@free-electrons.com>
Message-ID: <C6FAD3087A904266945B3CE0DDEC5D31@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
-----Oorspronkelijk bericht-----
Van: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Verzonden: zondag 15 februari 2015 21:55
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] [PATCH 1/1] make clean : also remove graphs.

Dear Sagaert Johan,

On Sun, 15 Feb 2015 17:02:52 +0100, Sagaert Johan wrote:
> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks for the patch! I however already sent an earlier patch doing the same thing (though in a slightly different way). See
http://patchwork.ozlabs.org/patch/436953/.

Maybe it should be applied to the master branch. Peter?

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com



Dear Thomas,

What a coincidence, it's no breaker anyway.

Btm ,while you are digging in the makefile, does it make sense to add a make clean-ccache ?

Thanks

Johan
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 6253 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150216/d71d387c/attachment.bin>
