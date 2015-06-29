From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 00:08:51 +0200
Subject: [Buildroot] [PATCH] configs/acmesystems_aria_g25: new config
In-Reply-To: <5591BA72.2040903@zacarias.com.ar>
References: <1435595496-8627-1-git-send-email-gustavo@zacarias.com.ar>
 <20150629221332.30296de3@free-electrons.com>
 <5591BA72.2040903@zacarias.com.ar>
Message-ID: <20150630000851.66e6e502@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 29 Jun 2015 18:36:50 -0300, Gustavo Zacarias wrote:

> Ouch, i'll send V2 with two configs (got 256MB hardware here, with the 
> 128MB config the memory is reduced as expected).

One thing that was bothering me in the contribution from Angelo was
specifically the need for two defconfigs. I guess there's no way to
runtime detect the memory size, and therefore build a single
at91bootstrap3 for both board configurations?

> > Also, could you review the patch from Angelo adding support for another
> > board from ACME:
> >
> >    http://patchwork.ozlabs.org/patch/485319/
> 
> The Arietta is a stripped down Aria, i'll take a look but i have no way 
> of testing it since i don't have one.

I really only asked for patch review, not testing. So not having the HW
is not a good excuse :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
