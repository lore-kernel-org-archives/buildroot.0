From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Jun 2014 18:38:27 +0200
Subject: [Buildroot] [PATCH] openntpd: add SysV initscript and user
In-Reply-To: <53A75C23.1090603@zacarias.com.ar>
References: <1402486395-15125-1-git-send-email-gustavo@zacarias.com.ar>
 <20140622172319.GA21768@free.fr> <53A75985.4040604@zacarias.com.ar>
 <20140622223724.GE21768@free.fr> <53A75C23.1090603@zacarias.com.ar>
Message-ID: <53A85803.4040900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/06/14 00:43, Gustavo Zacarias wrote:
> On 06/22/2014 07:37 PM, Yann E. MORIN wrote:
> 
>>>> Any reason why you name the user and group with a leading '_' ?
>>>
>>> Because the code says so, and it's not configurable.
>>> The group just to keep consistency.
>>
>> Ok, that should be noted as a comment above the user definition, I
>> guess.
> 
> Why?
> We don't document these details for systemd or other packages, why
> should we here?
> I think the _USERS variable is explicit enough as documentation.

 Also, it is explicit in the commit message. So I agree that the patch is OK as
is. Well, putting a comment wouldn't hurt of course.

 So anyway:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> Regards.
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
