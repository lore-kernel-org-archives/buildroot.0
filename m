From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 11 May 2015 10:16:29 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-05-10
In-Reply-To: <877fsfk1d4.fsf@dell.be.48ers.dk>
References: <20150511063014.873E6100FEC@stock.ovh.net>
 <877fsfk1d4.fsf@dell.be.48ers.dk>
Message-ID: <20150511081629.GB16123@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,
Peter Korsgaard wrote,

> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > Build statistics for 2015-05-10
>  > ===============================
> 
>  >         success : 279
>  >        failures : 18 
>  >        timeouts : 0  
>  >           TOTAL : 297
> 
> Wee, it's starting to look pretty good.
> 
>  >          arm |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/793e1774a5922db4424619aa5a397ec3d3d497b4/
> 
> It seems uClibc-ng (but not uClibc) has a ucontext_t issue. Waldemar,
> any ideas?
> 
> http://autobuild.buildroot.net/?reason=libsigsegv-2.10

I sent an update patch a few minutes ago.
A config symbol must be enabled. The feature is only available in
uClibc snapshot and uClibc-ng.

best regards
 Waldemar
