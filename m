From: Gilles Talis <gilles.talis@gmail.com>
Date: Thu, 21 Feb 2013 17:03:56 -0800
Subject: [Buildroot] libmad and AVR32 optimisations
In-Reply-To: <87hal5flkv.fsf@dell.be.48ers.dk>
References: <CAKcgs2zty=9pybVT7FwDMmSK0omc1x9tgwmDkgiMbixjFkv-oA@mail.gmail.com>
 <771436318.25518.1361402063381.JavaMail.root@advansee.com>
 <87621mhs7d.fsf@dell.be.48ers.dk>
 <CAHt8ZCNf=k9LyXMob_DpzcOYtfBfhfNugr8n02vNwpB+s1fpkg@mail.gmail.com>
 <87y5eigchn.fsf@dell.be.48ers.dk>
 <59153487.35651.1361449720550.JavaMail.root@advansee.com>
 <87ppzthm85.fsf@dell.be.48ers.dk>
 <CAHt8ZCNHZec838Ouh5tLtcxfhQJ1UHBQ1AhpaMGX1V+o-mjjkw@mail.gmail.com>
 <87hal5flkv.fsf@dell.be.48ers.dk>
Message-ID: <CAKcgs2xpmE=K5PFM_j-NOMTTHbW8k6KmJzHE7zoyTOwBQ-fUug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/2/21 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Simon" == Simon Dawson <spdawson@gmail.com> writes:
>
>  >> Simon, will you look into this?
>
>  Simon> Unfortunately, this approach doesn't work: using a regenerated avr32
>  Simon> patch from ASF, the madplay build still fails in exactly the same
>  Simon> manner if the architecture-specific optimisations are disabled for
>  Simon> libmad.
>
>  Simon> A simpler approach would be to force the arch-specific optimisations
>  Simon> to be enabled for avr32; would that be an acceptable compromise?
>
> Yes I think so. Care to send a patch?

Done. Thanks all for your valuable comments.
Gilles.
