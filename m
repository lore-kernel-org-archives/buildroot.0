From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Wed, 22 Mar 2017 18:51:04 -0400
Subject: [Buildroot] [RFC 2/3] rpi-userland: fix opengl library symlinks
In-Reply-To: <20170322234756.0a6deb80@free-electrons.com>
References: <20170322181331.23500-1-gael.portay@savoirfairelinux.com>
 <20170322181331.23500-3-gael.portay@savoirfairelinux.com>
 <20170322225421.5ce139f6@free-electrons.com>
 <20170322223851.vlc46h63xsksr3f5@gportay>
 <20170322234756.0a6deb80@free-electrons.com>
Message-ID: <20170322225104.32xu2q6fhyoph4fg@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, Mar 22, 2017 at 11:47:56PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 22 Mar 2017 18:38:51 -0400, Ga?l PORTAY wrote:
> 
> > WebEngine is not linked against those libraries: libraries are dynamically
> > loaded.
> 
> Ah, it uses dlopen() on specifically libEGL.so.1 and libOpenGLES.so.2,
> OK. Then it makes sense. Maybe your patch should be submitted upstream
> to rpi-userland?

I am on it.

I made a PR on github.

> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

Best regards,
Gael
