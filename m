From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Dec 2019 13:41:43 +0100
Subject: [Buildroot] [PATCH] package/glibc: drop dependency of utilities
 on bash
In-Reply-To: <CAJ4jsaez3Zs1DDeVATnq5cE9=1_oGUegg4nSux7GKT8TX-kR4A@mail.gmail.com>
References: <20191203001405.12984-1-unixmania@gmail.com>
 <20191205231729.2c16445c@windsurf>
 <CAJ4jsaca+BnSWrQ5Zcd9h_6o5705oe0z9fAjBr7bN6g65+RE=w@mail.gmail.com>
 <20191209085301.19cd9f52@windsurf.home>
 <CAJ4jsaez3Zs1DDeVATnq5cE9=1_oGUegg4nSux7GKT8TX-kR4A@mail.gmail.com>
Message-ID: <20191209134143.579ea9eb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 9 Dec 2019 08:41:40 -0300
Carlos Santos <unixmania@gmail.com> wrote:

> > Hum, OK. Perhaps another way is to simply have your patch make its way
> > upstream, and wait until the next glibc release to really use it in
> > Buildroot. In the mean time, we can keep the post patch hook that you
> > have implemented and that was merged in Buildroot.
> >
> > What is important is that at some point in the future, there will be an
> > upstream solution. We don't necessarily need to use it immediately in
> > Buildroot.  
> 
> RFE submitted: https://sourceware.org/bugzilla/show_bug.cgi?id=25259

Thanks a lot! Much appreciated.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
