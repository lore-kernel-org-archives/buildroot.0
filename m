From: Carlos Santos <casantos@datacom.com.br>
Date: Fri, 4 Jan 2019 08:05:41 -0200 (BRST)
Subject: [Buildroot] [PATCH v3 1/3] package/waf: add a blind
 Config.in.host
In-Reply-To: <20190104095811.33a189e4@windsurf>
References: <20181223171950.3979-1-casantos@datacom.com.br>
 <20181226223005.71dca29a@windsurf> <20181226215521.GL14286@scaer>
 <20190103225052.3feb76c6@windsurf> <20190103220652.GG5991@scaer>
 <1870289102.225265.1546558443354.JavaMail.zimbra@datacom.com.br>
 <20190104095811.33a189e4@windsurf>
Message-ID: <49851202.241713.1546596341117.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "Carlos Santos" <casantos@datacom.com.br>
> Cc: "Yann Morin" <yann.morin.1998@free.fr>, "Peter Korsgaard" <peter@korsgaard.com>, "Mahyar Koshkouei"
> <mahyar.koshkouei@gmail.com>, "Thomas De Schampheleire" <thomas.de_schampheleire@nokia.com>, "buildroot"
> <buildroot@buildroot.org>, "Arnout Vandecappelle" <arnout@mind.be>
> Sent: Sexta-feira, 4 de janeiro de 2019 6:58:11
> Subject: Re: [Buildroot] [PATCH v3 1/3] package/waf: add a blind Config.in.host

> Hello Carlos,
> 
> On Thu, 3 Jan 2019 21:34:03 -0200 (BRST), Carlos Santos wrote:
> 
>> Well, I'm happy that my work helped you guys to analyze the pros and
>> cons of having Config.in.host for all host packages. Looks like it's
>> not a good idea, so I will mark the patches as refused in patchwork.
> 
> I don't think we can conclude yet "it's not a good idea". At this
> point, my feeling is more: the consequences are worse than I initially
> expected, which requires some more thoughts on how we want to handle
> that.
> 
> Again, what was your motivation for adding those Config.in.host options
> in the first place, specifically for waf ? Was it just about getting
> this whole discussion started, and use waf just as a simple first
> example ?

It started when I realized that the trailing slashes in WAF_SITE and
other host packages. Then Arnout said "we need Config.in.host" and I
decided to give it a try. It may be a silly explanation but sometimes
we do things just for fun. :-)

-- 
Carlos Santos (Casantos) - DATACOM, P&D
