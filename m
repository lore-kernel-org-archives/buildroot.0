From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 8 Feb 2012 13:37:28 +0100
Subject: [Buildroot] problem creating package : download fails !
 (buildroot appends netpbm-10.35.83.gz
In-Reply-To: <ABF59CC0FD964B918D2A589BD7790307@JohanW7>
References: <ABF59CC0FD964B918D2A589BD7790307@JohanW7>
Message-ID: <CAAXf6LVEp4t1Bba8nCaD7Pezm5trHkroreGfhPa-iMUA7FO47A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johan,

On Wed, Feb 8, 2012 at 1:24 PM, Sagaert Johan <sagaert.johan@skynet.be> wrote:
> Hi
>
> I have a problem in creating a package : the download link does not work
>
> The link is
> http://kent.dl.sourceforge.net/project/netpbm/super_stable/10.35.83/netpbm-10.35.83.tgz
>
> But buildroot seems to append netpbm-10.35.83.gz
>
> So it tries http://kent.dl.sourceforge.net/project/netpbm/super_stable/10.35.83/netpbm-10.35.83.tgz/netpbm-10.35.83.gz
>
> That fails.
>
> How to resolve this ?

You really need to provide some more information. The above
description is way too vague.
Please provide your .mk file.

My guess is that you added the name of the package in the FOO_SITE
variable, while you shouldn't.

Best regards,
Thomas
