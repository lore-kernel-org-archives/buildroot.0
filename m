From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Dec 2015 01:01:48 +0100
Subject: [Buildroot] [PATCH] xutil_util-macros: move outside x11r7 scope
In-Reply-To: <5671E9D0.9000703@zacarias.com.ar>
References: <1449096338-8006-1-git-send-email-gustavo@zacarias.com.ar>
 <20151216234223.6abe26c3@free-electrons.com>
 <5671E9D0.9000703@zacarias.com.ar>
Message-ID: <5671FB6C.3080408@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16-12-15 23:46, Gustavo Zacarias wrote:
> On 16/12/15 19:42, Thomas Petazzoni wrote:
> 
>> Since you're renaming the Config.in option, some Config.in.legacy
>> handling is needed.
> 
> Hi.
> True, however much i doubt anybody is using it in their packages.
> 
>> I am wondering if util-macros isn't too generic. Should we name it
>> xorg-util-macros ? xorg-autotools-macros ? But admittedly, that's not
>> matching the upstream name.
> 
> In gentoo there's only one util-macros which has far more packages than
> buildroot, however in the future some other util-macros might appear so yes,
> xorg-util-macros sounds about right.

 I think renaming xutil_util-macros to xorg-util-macros is a lot of churn for
little gain. Wouldn't it be better to keep calling it xutil_util-macros and just
move the directory?

 Regards,
 Arnout

> This is just the tip of getting wayland/weston/gtk3 support back in shape, it's
> still WIP in some aspects but i want to push as many as the little bits as
> possible since they don't hurt and i don't want to pile up patches.
> I'll respin a v2.
> Regards.
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
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
