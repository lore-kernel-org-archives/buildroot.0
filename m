From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 18 Jul 2018 21:46:01 +0200
Subject: [Buildroot] [RFC v2 1/4] meson: bump version to 0.47.1
In-Reply-To: <87k1pt5jpz.fsf@tkos.co.il>
References: <20180717191605.19263-1-ps.report@gmx.net>
 <87o9f5636v.fsf@tkos.co.il> <20180717232319.75bc4941@gmx.net>
 <87k1pt5jpz.fsf@tkos.co.il>
Message-ID: <20180718214601.70379020@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Wed, 18 Jul 2018 06:03:04 +0300, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Peter,
> 
> Peter Seiderer writes:
> > On Tue, 17 Jul 2018 23:02:32 +0300, Baruch Siach <baruch@tkos.co.il> wrote:  
> >> Peter Seiderer writes:
> >>   
> >> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> >> > ---
> >> > Notes:
> >> > Hash not checked against the pgp signature, tried
> >> > 	$ gpg --verify meson-0.47.1.tar.gz.asc meson-0.47.1.tar.gz
> >> >   gpg: Signature made Di 10 Jul 2018 23:28:12 CEST
> >> >   gpg:                using RSA key 95181F4EED14FDF4E41B518D3BF4693BFEEB9428
> >> >   gpg: Can't check signature: No public key
> >> >
> >> > Any advice which public key is used to sign the meson package?    
> >> 
> >> The key ID is shown in the message above. You can import the key and
> >> verify with:
> >> 
> >>   gpg --recv-keys 95181F4EED14FDF4E41B518D3BF4693BFEEB9428
> >>   gpg --verify meson-0.47.1.tar.gz.asc
> >> 
> >> gpg: Signature made Wed 11 Jul 2018 12:28:12 AM IDT
> >> gpg:                using RSA key 95181F4EED14FDF4E41B518D3BF4693BFEEB9428
> >> gpg: Good signature from "Jussi Pakkanen <jpakkane@gmail.com>" [marginal]  
> >
> > Thanks for the hint!
> >
> > I get the same warning as Eric:
> >
> >   gpg: WARNING: This key is not certified with a trusted signature!
> >   gpg:          There is no indication that the signature belongs to the owner.
> >   Primary key fingerprint: 9518 1F4E ED14 FDF4 E41B  518D 3BF4 693B FEEB 9428
> >
> > To 'trust' the signing I need a trust-chain (or an 'official' signed public key) or
> > an second source where I can compare the fingerprint against? Your seem to have
> > an 'marginal' trust-chain?  
> 
> I enabled TOFU[1] in my gpg configuration. TOFU makes more sense to me
> for my use of gpg.

Thanks for tip, will take look at it and try...

Regards,
Peter

> 
> baruch
> 
> [1] https://www.gnupg.org/ftp/people/neal/tofu.pdf
> 
