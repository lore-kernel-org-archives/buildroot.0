From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 14 Jan 2018 19:16:54 +0100
Subject: [Buildroot] [PATCH] swupdate: remove empty line
In-Reply-To: <20180114180339.GC20105@scaer>
References: <20180114175306.18388-1-joerg.krause@embedded.rocks>
 <20180114180339.GC20105@scaer>
Message-ID: <1515953814.8426.5.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, 2018-01-14 at 19:03 +0100, Yann E. MORIN wrote:
> J"org, All,
> 
> On 2018-01-14 18:53 +0100, J?rg Krause spake thusly:
> > Reported by Yann E. Morin running:
> > 
> > ```
> >     $ ./utils/check-package package/swupdate/swupdate.mk
> >     package/swupdate/swupdate.mk:42: consecutive empty lines
> >     140 lines processed
> >     1 warnings generated
> > ```
> 
> Note: I could have very well done it myself, but by having other do it,
> that spreads the knowledge, and people get used to running it before
> submitting. Or so I hope! ;-)

No problem! Mostly I am running check-package only when submitting a
new package. But, I will try next time to remember of running it every
time :-)

J?rg
