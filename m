From: Vadim Kochan <vadim4j@gmail.com>
Date: Sun, 7 Apr 2019 12:27:44 +0300
Subject: [Buildroot] [RFC 1/1] support/kconfig: Allow to override
 'default' config property
In-Reply-To: <871s2emiei.fsf@dell.be.48ers.dk>
References: <20190407001006.12925-1-vadim4j@gmail.com>
 <20190407062440.GG2659@scaer> <871s2emiei.fsf@dell.be.48ers.dk>
Message-ID: <20190407092744.giawzrzdjea53ne2@vkochan-ThinkPad-T470p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Peter, All

On Sun, Apr 07, 2019 at 08:36:05AM +0200, Peter Korsgaard wrote:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
> Hi,
> 
>  > Really, the defconfig *is* the place where defaults are overriden.
> 
>  > For example, at work, I handle a single br2-external for two "projects"
>  > that each have four "boards", and each have three configurations. There
>  > is no way your proposal can cover this.
> 
>  > Alternatively, what you propose is just pushing the feature of a
>  > defconfig into the language itself. I don't think this is a good idea.
>  > Even more so, as your proposal does not address all the cases either:
>  > it only catters for strings, but what about choices, tri-states?
> 
>  > So, I'll be harsh, but NAK.
> 
> FWIW, I completely agree with Yanns points. Having two ways of
> configuring this (defconfigs and br2-external trees) makes things more
> complicated for little added value.
> 

Yes, I understand the priority is for simplicity. I just thought that
"extrernal" board tree may have defaults which really belongs to this
particular board, and it makes flexible solution to already apply
defaults by board, if to introduce separate keyword for this like
"override" then maybe it would be clearer which configs are overriden.

Sending this to the kernel's kconfig mailing-list is really no chance to be applied
because there should be no such case (but maybe in case of external modules).

OK, sorry to bother with this question!

Regards,
Vadim Kochan
