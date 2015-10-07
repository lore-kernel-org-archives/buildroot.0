From: Jaap Crezee <jaap@jcz.nl>
Date: Wed, 7 Oct 2015 14:26:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/nodejs: Add node.js v4.1.2
In-Reply-To: <87612jnl7c.fsf@dell.be.48ers.dk>
References: <1444136239-22044-1-git-send-email-jaap@jcz.nl>
 <87612jnl7c.fsf@dell.be.48ers.dk>
Message-ID: <56150F59.1030606@jcz.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On 10/07/15 10:20, Peter Korsgaard wrote:
>>>>>> "Jaap" == Jaap Crezee <jaap@jcz.nl> writes:
>  >  config BR2_PACKAGE_NODEJS_VERSION_STRING
>  >  	string
>  >  	default "0.10.40"	if BR2_BR2_PACKAGE_NODEJS_0_10_X
>  >  	default "0.12.7"	if BR2_BR2_PACKAGE_NODEJS_0_12_X
>  > +	default "4.1.2"     if BR2_BR2_PACKAGE_NODEJS_4_1_X
> 
> Is there a need to keep both 0.12.x and 4.1.x? The only reason we have a
> version selection is afaik that <ARMv7 is only supported in the old
> 0.10.x version.

Well not from my side. Our project just needs 4.x and I didn't want to break other users
who might still be depending on 0.12.x. I am not sure about downwards compatibility of 4.x.


regards,

Jaap Crezee
