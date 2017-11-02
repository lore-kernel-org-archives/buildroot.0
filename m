From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 2 Nov 2017 11:40:55 -0200 (BRST)
Subject: [Buildroot] [PATCH v2] util-linux: security bump to version 2.31
In-Reply-To: <87r2thf431.fsf@dell.be.48ers.dk>
References: <1509446871-25076-1-git-send-email-casantos@datacom.ind.br>
 <87zi87ezym.fsf@dell.be.48ers.dk>
 <232020389.16019836.1509500098756.JavaMail.zimbra@datacom.ind.br>
 <87r2thf431.fsf@dell.be.48ers.dk>
Message-ID: <253552528.16218833.1509630055116.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Peter Korsgaard" <peter@korsgaard.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>, sv99 at inbox.ru
> Cc: buildroot at buildroot.org
> Sent: Thursday, November 2, 2017 7:00:02 AM
> Subject: Re: [PATCH v2] util-linux: security bump to version 2.31

>>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:
> 
> > How many nommu architectures does Buildroot support? The only boards I
> > found without BR2_USE_MMU were qemu_{arm_versatile,xtensa_lx60}_nommu,
> > which obviously do not even have RF radios to turn on/off.
> 
> It is indeed probably a quite rare combination. Perhaps we should get
> rid of the separate rfkill package then and add Config.in.legacy
> handling for it selecting the util-linux option?
> 
> Volkov, you added the rfkill package. Any issues with moving to the
> util-linux variant instead?

I already submitted a patch to remove the rfkill package:

    https://patchwork.ozlabs.org/patch/828969/

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
