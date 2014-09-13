From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Sat, 13 Sep 2014 07:59:53 +0200
Subject: [Buildroot] [PATCH 03/12] xapp_xinit: depends on MMU
In-Reply-To: <87ioksbkqd.fsf@dell.be.48ers.dk>
References: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
 <1410537011-29662-4-git-send-email-jezz@sysmic.org>
 <87ioksbkqd.fsf@dell.be.48ers.dk>
Message-ID: <7881839.ucOfB3xDHT@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 12 September 2014 23:19:06 Peter Korsgaard wrote:
> >>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:
[...]
>  >  	# Runtime dependency: can't start an X server unless there is one
>  >  	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
>  > 
>  > -	# Runtime dependency; mcookie is also in util-linux
>  > +	#Runtime dependency; mcookie is also in util-linux
> 
> I'm not sure why you want to change this. Committed without this line,
> thanks.
I don't known either why... It is a mishandling.

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
