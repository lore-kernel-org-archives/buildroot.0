From: Markus Mayer <mmayer@broadcom.com>
Date: Sat, 13 Jun 2020 20:34:28 -0700
Subject: [Buildroot] ebtables and musl
In-Reply-To: <87lfkqe4hk.fsf@tarshish>
References: <CAGt4E5tuHRkxko=NPY+-YsWwnhk1McnJMU_LmdcShHFuRjTkMA@mail.gmail.com>
 <20200613132317.4edb7676@gmx.net> <20200613144325.6c88eb8d@gmx.net>
 <CAGt4E5s_t30GHmTFiSA3MZQo0Vj-fkqvGPPc9kNdoa6w6-B7DA@mail.gmail.com>
 <87lfkqe4hk.fsf@tarshish>
Message-ID: <CAGt4E5v4-5FxqZTENCMreZah33Yo8A3NJNactKK9BfMJzKxUPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 13 Jun 2020 at 20:00, Baruch Siach <baruch@tkos.co.il> wrote:
>
> Hi Markus,
>
> On Sat, Jun 13 2020, Markus Mayer wrote:
>
> > On Sat, 13 Jun 2020 at 05:43, Peter Seiderer <ps.report@gmx.net> wrote:
> >> On Fri, 12 Jun 2020 13:10:28 -0700, Markus Mayer <mmayer@broadcom.com> wrote:
> >> > > While we are on the topic of ebtables, why is buildroot still using
> >> > > v2.0.10-4 from 2014 when there is 2.0.11 from 2019 (as per
> >> > > http://ftp.netfilter.org/pub/ebtables/)? Is it just a matter of
> >> > > submitting a patch to update it or is there an underlying reason to
> >> > > keep the old version around?
> >> >
> >> > Probably not, care to send an ebtables update patch?
> >
> > Sure. I'll send a patch.
>
> We have a version upgrade patch in patchwork:
>
>   http://patchwork.ozlabs.org/project/buildroot/patch/20200427212653.29933-1-ryanbarnett3 at gmail.com/
>
> You might want to test and contribute your Tested-by.

Will do. I'll let you know how it goes.

Regards,
-Markus

> baruch
>
> --
>                                                      ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
