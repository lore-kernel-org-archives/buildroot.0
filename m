From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Feb 2018 16:34:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/wf111: bump to version 5.2.2-r3
In-Reply-To: <877es3irx9.fsf@dell.be.48ers.dk>
References: <20180126162021.5520-1-corjon.j@ecagroup.com>
 <877es3irx9.fsf@dell.be.48ers.dk>
Message-ID: <20180203153442.GM2369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On 2018-01-27 10:15 +0100, Peter Korsgaard spake thusly:
> >>>>> "Julien" == Julien Corjon <corjon.j@ecagroup.com> writes:
> 
>  > Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
>  > ---
>  >  package/wf111/wf111.mk | 8 ++++----
>  >  1 file changed, 4 insertions(+), 4 deletions(-)
> 
>  > diff --git a/package/wf111/wf111.mk b/package/wf111/wf111.mk
>  > index ad9d89149d..ed55672136 100644
>  > --- a/package/wf111/wf111.mk
>  > +++ b/package/wf111/wf111.mk
>  > @@ -4,7 +4,7 @@
>  >  #
>  >  ################################################################################
>  
>  > -WF111_VERSION = 5.2.2-r2
>  > +WF111_VERSION = 5-2-2-r3
> 
> The Config.in refers to
> http://www.bluegiga.com/en-US/products/wifi-modules/wf111-wifi-module/,
> which redirects to silabs.com nowadays, so it is not directly clear
> where to find the tarballs.

It also look that we can now download without any click-wrap
registration, so this can now be automated, rather than require a local
tarball.

Care to send a patch doing the download?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
