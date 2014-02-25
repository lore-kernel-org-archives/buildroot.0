From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 25 Feb 2014 21:38:32 +0100
Subject: [Buildroot] [PATCH v2 2/2] manual: add virtual package tutorial.
In-Reply-To: <CAHXCMM+zjqV=jtyN64aVnPU+CYn1mkw35i_NVGu5XnRX=jcngg@mail.gmail.com>
References: <1393343137-4209-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1393343137-4209-3-git-send-email-eric.le.bihan.dev@free.fr>
 <CAHXCMM+zjqV=jtyN64aVnPU+CYn1mkw35i_NVGu5XnRX=jcngg@mail.gmail.com>
Message-ID: <20140225203831.GA3340@milhouse>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Tue, Feb 25, 2014 at 09:01:54PM +0100, Samuel Martin wrote:
> Hi Eric,
>
> On Tue, Feb 25, 2014 at 4:45 PM, Eric Le Bihan
> <eric.le.bihan.dev@free.fr> wrote:
> [...]
> > +
> > +Provider +Config.in+ file
> > +^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +The +Config.in+ file of the package 'some-provider', which provides the
> > +functionalities of 'something-virtual', should contain:
> > +
>
> No word about the provider's *.mk file which does not need any change?
I added a line about it, but when I converted the example to plain section, I
have not noticed that the line stayed above the targeted section ("D'Oh"^5)...
Will fix.

Thanks for your reviews!

Best regards,
ELB
