From: Vadim Kochan <vadim4j@gmail.com>
Date: Thu, 4 Apr 2019 00:11:53 +0300
Subject: [Buildroot] [PATCH 1/1] pkg-autotools-infra: disable NLS for
 the host by default
In-Reply-To: <20190403213422.0980f4f5@windsurf>
References: <1554306055-16183-1-git-send-email-email@gmail.com>
 <20190403213422.0980f4f5@windsurf>
Message-ID: <20190403211153.xectvdadhe7nf4lu@vkochan-ThinkPad-T470p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Apr 03, 2019 at 09:34:22PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed,  3 Apr 2019 18:40:55 +0300
> Vadim Kochan <vadim4j@gmail.com> wrote:
> 
> > From: Vadim Kochan <vadim4j@gmail.com>
> > 
> > There is no need for language translaion feature for the host packages,
> > anyway some of them disable it explicitly, so lets do it automatically
> > at least for the host-autotools- kind of packages.
> > 
> > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> 
> Thanks for the patch. One question below, though.
> 
> > +		--disable-nls \
> > +		--disable-nls-macos \

Yeahh, sorry I took it from guterprint, but it should be removed at all.

> 
> What is --disable-nls-macos ? Why do we need to pass it even though no
> package is passing it right now ?
> 
> It should perhaps be a separate patch, or at the very least be
> explained in the commit log.
> 

Regards,
Vadim Kochan
