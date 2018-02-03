From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Feb 2018 18:07:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/wf111: Fix manufacturer name
 and url
In-Reply-To: <20180203154015.GN2369@scaer>
References: <20180129082819.13870-1-corjon.j@ecagroup.com>
 <20180203154015.GN2369@scaer>
Message-ID: <20180203170735.GO2369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, all,

On 2018-02-03 16:40 +0100, Yann E. MORIN spake thusly:
> On 2018-01-29 09:28 +0100, Julien Corjon spake thusly:
> > Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
[--SNIP--]
> >  config BR2_PACKAGE_WF111_TARBALL_PATH
> >  	string "Local tarball location"
> >  	help
> > -	  The WF111 tarball can be retrieved on the BlueGiga website
> > -	  after registration. This option specifies the path where the
> > -	  tarball is locally saved.
> > +	  The WF111 tarball can be retrieved on the Silicon Labs
> > +	  website after registration. This option specifies the path
> > +	  where the tarball is locally saved.
> 
> As I just replied to your previous patch (but you were dropped from Cc
> for whatever reason), this is no longer true: one can very well do the
> download without registration nowdays: try to download the URLs from
> command line:
> 
>     wget 'https://www.silabs.com/documents/login/software/wf111-linux-driver-5-2-2-r3-armv5te.tar.gz'
> 
> and it magically works now. So we can drop the special local tarball
> path now. Care to send a patch?

I got bored not being at FOSDEM, so I did it:
    https://patchwork.ozlabs.org/patch/868928/

And I also fixed the armv5 case:
    https://patchwork.ozlabs.org/patch/868927/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
