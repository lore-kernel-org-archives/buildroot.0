From: mlweber1 at rockwellcollins.com <mlweber1@rockwellcollins.com>
Date: Mon, 16 Dec 2013 09:35:10 -0600
Subject: [Buildroot] [PATCH 1/1] smcroute: new package
In-Reply-To: <CAAXf6LU8=fxMQKZQZfAOW-jX3b_466XnToBxFANkck6dNyx-Vw@mail.gmail.com>
References: <1386872059-28046-1-git-send-email-mlweber1@rockwellcollins.com>	<3a2395ee-73bc-4723-a368-61194e9c0a08@email.android.com>
 <OF808C467A.175074BD-ON86257C43.004D34F3-86257C43.004D9D54@rockwellcollins.com>
 <CAAXf6LU8=fxMQKZQZfAOW-jX3b_466XnToBxFANkck6dNyx-Vw@mail.gmail.com>
Message-ID: <OF05AD536D.26A24F69-ON86257C43.0055836E-86257C43.00559E19@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote on 12/16/2013 
09:25:41 AM:

> From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> To: mlweber1 at rockwellcollins.com
> Cc: buildroot <buildroot@busybox.net>, Sean Gerhardt 
> <sagerhar@rockwellcollins.com>
> Date: 12/16/2013 09:25 AM
> Subject: Re: [Buildroot] [PATCH 1/1] smcroute: new package
> 
> Hi Matt,
> 
> On Mon, Dec 16, 2013 at 3:07 PM,  <mlweber1@rockwellcollins.com> wrote:
> 
> >> >+SMCROUTE_SITE = $(call 
github,troglobit,smcroute,$(SMCROUTE_VERSION))
> >> >+SMCROUTE_SOURCE =
> > troglobit-smcroute-$(SMCROUTE_VERSION)-0-g58388f6.tar.gz
> >>
> >> Why is it needed to specify _SOURCE here? It shouldn't be ..
> > It seems like the releases are labeled in a way that requires this.
> > Without
> > specifying the source archive name, the archive that's requested to be
> > downloaded
> > "smcroute-$(SMCROUTE_VERSION).tar.gz" ends up as the file we noted as 
the
> > SOURCE.
> 
> I'm not sure I understand what you mean.
> When I remove the _SOURCE line, I can still download and extract the
> package normally. The name of the tar file is indeed different, but
> this does not matter. The package infrastructure still correctly
> handles it.
> 
> If you still think this _SOURCE is needed, could you explain in more 
detail?
I'll retest, I couldn't get the package infrastructure to handle the 
change of package name after download.  Good to know that it should
as that's much cleaner then my approach.

Thanks,
Matt
