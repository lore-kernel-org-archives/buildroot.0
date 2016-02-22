From: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Date: Mon, 22 Feb 2016 17:21:54 -0500 (EST)
Subject: [Buildroot] pjsip package status
In-Reply-To: <20160220173543.GE3418@free.fr>
References: <1914178697.329791.1455739489770.JavaMail.zimbra@savoirfairelinux.com>
 <20160220173543.GE3418@free.fr>
Message-ID: <841623823.459573.1456179714125.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, 

Sure I can take a look at this but my BR experience is quite limited. 
Not sure about gsm, srtp, and portaudio. Why aren't they treated like other options? Are you sure they're necessary for Asterisk application? 
I thought configure options should limit the package footprint as much as possible. 

Regards, 

-- 
Patrick Keroulas 
Consultant en logiciel libre, 
Savoir-faire Linux Inc. 

7275 Saint-Urbain, bureau 200 
Montr?al, Qu?bec H2R 2Y5 
t?l: (514) 276-5468 ext. 167 
fax: (514) 276-5465 
_____________________ 


From: "Yann E. MORIN" <yann.morin.1998@free.fr> 
To: "Patrick Keroulas" <patrick.keroulas@savoirfairelinux.com> 
Cc: "buildroot" <buildroot@busybox.net> 
Sent: Saturday, February 20, 2016 12:35:43 PM 
Subject: Re: [Buildroot] pjsip package status 

Patrick, All, 

On 2016-02-17 15:04 -0500, Patrick Keroulas spake thusly: 
> Regarding pjsip package ( [1]http://lists.busybox.net/pipermail/buildroot/2015-April/126960.html ), is there any reason why it's not 
> part of the package collection yet? 

You may want to have a look at my in-proress series that adds Asterisk. 
The last few patches are to add pjsip. 
https://git.buildroot.org/~ymorin/git/buildroot/log?h=yem/asterisk 

Please have a look and provide your feedback. 

I will probably send that series shortly afte rthe next release is cut 
(i.e. in errly March). 

Regards, 
Yann E. MORIN. 

> Regards, 
> -- 
> Patrick Keroulas 
> Consultant en logiciel libre, 
> Savoir-faire Linux Inc. 
> 
> 7275 Saint-Urbain, bureau 200 
> Montr?al, Qu?bec H2R 2Y5 
> t?l: (514) 276-5468 ext. 167 
> fax: (514) 276-5465 
> _____________________ 
> 
> Links: 
> 1. http://lists.busybox.net/pipermail/buildroot/2015-April/126960.html 

> _______________________________________________ 
> buildroot mailing list 
> buildroot at busybox.net 
> http://lists.busybox.net/mailman/listinfo/buildroot 


-- 
.-----------------.--------------------.------------------.--------------------. 
| Yann E. MORIN | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: | 
| +33 662 376 056 | Software Designer | \ / CAMPAIGN | ___ | 
| +33 223 225 172 `------------.-------: X AGAINST | \e/ There is no | 
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL | v conspiracy. | 
'------------------------------^-------^------------------^--------------------' 
_______________________________________________ 
buildroot mailing list 
buildroot at busybox.net 
http://lists.busybox.net/mailman/listinfo/buildroot 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160222/45bde57e/attachment.html>
