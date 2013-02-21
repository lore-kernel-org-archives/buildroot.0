From: =?utf-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Thu, 21 Feb 2013 13:28:40 +0100 (CET)
Subject: [Buildroot] libmad and AVR32 optimisations
In-Reply-To: <87y5eigchn.fsf@dell.be.48ers.dk>
References: <CAKcgs2zty=9pybVT7FwDMmSK0omc1x9tgwmDkgiMbixjFkv-oA@mail.gmail.com>
 <771436318.25518.1361402063381.JavaMail.root@advansee.com>
 <87621mhs7d.fsf@dell.be.48ers.dk>
 <CAHt8ZCNf=k9LyXMob_DpzcOYtfBfhfNugr8n02vNwpB+s1fpkg@mail.gmail.com>
 <87y5eigchn.fsf@dell.be.48ers.dk>
Message-ID: <59153487.35651.1361449720550.JavaMail.root@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard, all,

On Thursday, February 21, 2013 11:58:12 AM, Peter Korsgaard wrote:
> >>>>> "Simon" == Simon Dawson <spdawson@gmail.com> writes:
> 
>  Simon> On 21 February 2013 10:33, Peter Korsgaard <jacmet@uclibc.org> wrote:
>  >> Or simply get rid of the huge patch - It's just an optimization, and not
>  >> really needed, right?
> 
>  Simon> The problem is that, for libmad to be usable on avr32, this
>  Simon> optimization patch really *is* needed.
> 
> Ok, then lets fix it up instead.

To fix it up, you can check if libmad is provided with the ASF:
http://www.atmel.com/tools/AVRSOFTWAREFRAMEWORK.aspx

If so, it may have been cleaned up since the BuildRoot patch, so generate a new
patch from the ASF against mainline libmad, and retest.

Best regards,
Beno?t
