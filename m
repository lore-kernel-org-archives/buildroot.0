From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Fri, 09 Oct 2015 09:13:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/nodejs: Add node.js v4.1.2
In-Reply-To: <87k2qwbk24.fsf@dell.be.48ers.dk>
References: <1444136239-22044-1-git-send-email-jaap@jcz.nl>
 <87612jnl7c.fsf@dell.be.48ers.dk> <1444255455.5183.2.camel@embedded.rocks>
 <87k2qwbk24.fsf@dell.be.48ers.dk>
Message-ID: <1444374793.2909.7.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,

On Fr, 2015-10-09 at 09:03 +0200, Peter Korsgaard wrote:
> > > > > > "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:
> 
> Hi,
> 
> > > >  config BR2_PACKAGE_NODEJS_VERSION_STRING
>  >> >  	string
>  >> >  	default "0.10.40"	if
> BR2_BR2_PACKAGE_NODEJS_0_10_X
>  >> >  	default "0.12.7"	if
> BR2_BR2_PACKAGE_NODEJS_0_12_X
>  >> > +	default "4.1.2"     if BR2_BR2_PACKAGE_NODEJS_4_1_X
>  >> 
>  >> Is there a need to keep both 0.12.x and 4.1.x? The only reason we
>  >> have a
>  >> version selection is afaik that <ARMv7 is only supported in the
> old
>  >> 0.10.x version.
> 
>  > Yes, there is! Node.js applications written for Node.js 0.12.x are
> not
>  > necessarily compatible with Node.js 4.x.
> 
> Ok, but where does that leave us? Is the 0.12.x series still
> supported
> upstream? When can it be dropped?
> 

The Node.js foundation has a plan to establish Long-Term Support for
the current releases [1]. However, it is not officially yet.

[1] http://dailyjs.com/2015/07/01/node-long-term-support-working-group/
