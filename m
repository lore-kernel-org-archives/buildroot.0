From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 9 Mar 2018 22:09:11 -0300 (BRT)
Subject: [Buildroot] [git commit] tpm2-tss: new package
In-Reply-To: <878tb1hrf8.fsf@dell.be.48ers.dk>
References: <20180308090237.C2C4582814@busybox.osuosl.org>
 <1431823865.1093060.1520538814142.JavaMail.zimbra@datacom.ind.br>
 <878tb1hrf8.fsf@dell.be.48ers.dk>
Message-ID: <497594174.1292740.1520644151438.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Peter Korsgaard" <peter@korsgaard.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: "buildroot" <buildroot@buildroot.org>
> Sent: Friday, March 9, 2018 6:26:03 PM
> Subject: Re: [git commit] tpm2-tss: new package

>>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:
> 
> >> From: "Peter Korsgaard" <peter@korsgaard.com>
> >> To: "buildroot" <buildroot@buildroot.org>
> >> Sent: Thursday, March 8, 2018 5:58:02 AM
> >> Subject: [Buildroot] [git commit] tpm2-tss: new package
> 
> >> commit:
> >> https://git.buildroot.net/buildroot/commit/?id=7b3bb51809517ea045dedc8544db51fc0515d5b4
> >> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> > What about the other packages in this series, tpm2-abrmd and tmp2-tools?
> 
> They will come, I just ran out of time to review the other day.
> 
> Thomas asked on IRC why this was x86 only. Can you explain why?

Because it needs a hardware TPM, which as far as I know is available
only in some Intel processors (I tested it in a C3000 SOC).

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
