From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Thu, 10 Dec 2015 16:09:55 +1100
Subject: [Buildroot] [PATCH v2 0/4] Handle generated kconfig defconfigs
In-Reply-To: <20151209215342.GB3743@free.fr>
References: <cover.1441166076.git.sam.bobroff@au1.ibm.com>
 <20151209215342.GB3743@free.fr>
Message-ID: <20151210050955.GA19560@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 09, 2015 at 10:53:42PM +0100, Yann E. MORIN wrote:
> Sam, All,
> 
> On 2015-09-02 13:54 +1000, Sam Bobroff spake thusly:
> [--SNIP--]
> > Sam Bobroff (4):
> >   Handle kconfig generated defconfigs
> >   package/linux: Handle generated defconfigs
> >   boot/at91bootstrap3: Handled generated defconfigs
> >   boot/barebox: Handle generated defconfigs
> 
> We've discussed this series of yours a while ago on IRC, and we decided
> I would adopt it to clean it and respin it. I've now done that, and just
> resent an updated version of your patches:
> 
>     https://patchwork.ozlabs.org/patch/554822/
>     https://patchwork.ozlabs.org/patch/554823/
>     https://patchwork.ozlabs.org/patch/554824/
>     https://patchwork.ozlabs.org/patch/554825/
>     https://patchwork.ozlabs.org/patch/554826/
> 
> Of course, those patches are still attributed to you as the author.
> You ar ewelcome to review them and give your opinion and this new
> iteration.
> 
> Thank you very much for your initial submission! :-)
> 
> Regards,
> Yann E. MORIN.

Hi Yann,

Looks good to me, thanks for cleaning it up :-)

One thing that bothered me was that I wasn't able to test the non-kernel parts
of it. Has someone been able to do that?

Cheers,
Sam.
