From: =?utf-8?Q?=C3=89tienne_Ph=C3=A9lip?= <etienne.phelip@savoirfairelinux.com>
Date: Tue, 18 Apr 2017 10:28:35 -0400 (EDT)
Subject: [Buildroot] [PATCH v7] Add defconfig for MIPS Creator ci40
In-Reply-To: <5ad83116-cb48-c00b-1d74-609b9617d604@mind.be>
References: <1491378735-6506-1-git-send-email-abhimanyu.v@gmail.com>
 <d89680b5-ad66-0fcc-a0ae-47132b0ad8c4@mind.be>
 <CA+V_ovshFwELPeY71fHV5aiqD=X02GG682TMnD79UcCtAQYV-g@mail.gmail.com>
 <5ad83116-cb48-c00b-1d74-609b9617d604@mind.be>
Message-ID: <407796821.121847.1492525715801.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout, all,

[added Gael in CC]

----- Le 10 Avr 17, ? 17:00, Arnout Vandecappelle arnout at mind.be a ?crit :

>> Error: Missing argument
>> 
>> This is due to mix of positional and optional argument. Anything wrong with
>> config or it is issue with genimage.sh script.
> 
> It's the genimage.sh script that's not right. It doesn't support BINARIES_DIR
> as the first argument, which means it can't be used directly as a post-image
> script.
> 
> Etienne, any chance of fixing that?

Sorry for the delay. I do agree with Gael's suggestions in V8.

I can submit a fix, what do you think?

Regards,
Etienne
