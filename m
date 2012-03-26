From: Will Newton <will.newton@gmail.com>
Date: Mon, 26 Mar 2012 18:54:11 +0100
Subject: [Buildroot] Host libxml-parser-perl build issue
In-Reply-To: <20120326192243.6bb4e9d4@skate>
References: <CAFbHwiSJuD+cJRiiLRWM9siAmuCvSBH+25DTS_0CPgN3WxSbLA@mail.gmail.com>
 <20120326192243.6bb4e9d4@skate>
Message-ID: <CAFbHwiQQwBbj84r0cJAT+eJasO0_UZxn=cGQadNwdr7ph7TFQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 26, 2012 at 6:22 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

Hi Thomas,

> Hello,
>
> Le Mon, 26 Mar 2012 17:35:29 +0100,
> Will Newton <will.newton@gmail.com> a ?crit :
>
>> I have a build failure building avahi on a CentOS 5 system (old, but
>> not ancient) which is caused by the configure script failing to load
>> the XML::Parser perl module.
>
> I guess it looks like:
> http://autobuild.buildroot.org/results/4a9ad56f4690d6958164fac72bce8b97db6d2356/build-end.log
>
> Correct?

Yes, that's what it looks like. I can get a full log of build output
when I am back in the office.

> If so, do you have Perl to the target enabled in your configuration?

No, the only perl stuff being built is for host tool dependencies.
