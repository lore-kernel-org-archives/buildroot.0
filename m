From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 6 Oct 2008 12:55:49 -0300
Subject: [Buildroot] [PATCH] enhance directfb configurability
In-Reply-To: <gc8h2p$eil$2@ger.gmane.org>
References: <gc8h2p$eil$2@ger.gmane.org>
Message-ID: <d6cda7730810060855n6f1f710cmb149c7b3165ef29d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---------- Forwarded message ----------
From: Thiago A. Corr?a <thiago.correa@gmail.com>
Date: Mon, Oct 6, 2008 at 12:00 PM
Subject: Re: [Buildroot] [PATCH] enhance directfb configurability
To: Micha Nelissen <micha@neli.hopto.org>


[...]
> +               --with-inputdrivers=$(DIRECTFB_INPUT) \
> +               --enable-static \

I'm not sure if forcing static lib on everyone is the right thing. If
there is only one application on the system that depends on DirectFB,
it might save some bytes, but if there are more than 1, shared lib
would be prefered.

The rest seams to be quite good improvements.

Kind Regards,
  Thiago A. Correa

PS: Sorry, forgot to include the list address.
