From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Sep 2013 20:56:21 +0200
Subject: [Buildroot] [PATCH 0/3] Support for out-of-tree Buildroot
	customization
In-Reply-To: <20130914221613.GA3444@free.fr>
References: <20130911091700.0b24df41@skate>
 <OFA3C6DE52.DF6BBCA7-ON86257BE3.0054A3F9-86257BE3.00577394@rockwellcollins.com>
 <20130911172709.GB3410@free.fr>
 <CAAXf6LVD590fVudge3Fk+2B8pSzvUEV2GQLTcbz=VpOB2HCmtQ@mail.gmail.com>
 <20130912202157.536e5904@skate>
 <F9C551623D2CBB4C9488801D14F864C639AC8DAF@ex-mb1.corp.adtran.com>
 <20130912203359.7e650ebe@skate> <52323A54.7020808@mind.be>
 <20130912221256.GE3362@free.fr> <523388B6.7090305@mind.be>
 <20130914221613.GA3444@free.fr>
Message-ID: <52375455.7010602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/09/13 00:16, Yann E. MORIN wrote:
> Arnout, All,
>
> Once again, I am not a lawyer, and the below is not legal advice.
> Anyone sane would consult a lawyer for a definitive legal counsel.

[snip]

  I'm not going to quote the entire mail, but I agree with Yann's analysis.


[snip]
>>   After thinking about it this much, it looks like the buildroot license is a
>> lot more lenient than I first thought. But of course, I don't really now.
>
> I don't believe you could call the GPLv2 'lenient'. In fact I would call
> it anything but lenient: anything that is a derived work of Buildroot is
> covered by its license.
>
> Note: the target rootfs is *not* a derived work of Buildroot.

  With "lenient" I mean that, even though the GPL forces you to make the 
buildroot source available if you use it to build a GPL'ed program, there 
is in fact nothing compelling you to make the _complete_ buildroot source 
(and .config) available - as long as it produces the same GPL'ed program.

  My intuitive assumption, without thinking about it, was that if you are 
compelled to make the buildroot source available, that also means that 
you're compelled to make your modifications (e.g. additional proprietary 
packages) available. However, our analysis in this thread seems to 
indicate that it doesn't. That's why I said it is more lenient than I 
thought.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
