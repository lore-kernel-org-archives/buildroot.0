From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 28 Sep 2015 23:00:48 +0200
Subject: [Buildroot] [RFC 00/37] efl bump to 1.14.2
In-Reply-To: <CAAMcf8DcwuJvASF1A12hLSTKsyK3553CL5hv9dnPT+vrMwo9sA@mail.gmail.com>
References: <CAAMcf8CO9XsiTBOJX3APO+ZXtyPLDZmHq2EU0LPT3UXKhTC-=g@mail.gmail.com>
 <55D6F4A8.3000104@openwide.fr>
 <CAAMcf8COScfy62sEC4uPKHw=LgyLWWtic9ypCF0DZMfu21hzdg@mail.gmail.com>
 <55DB8FAF.7060509@openwide.fr>
 <CAAMcf8Cp0+p4rG+SYc3EHyQaahBe5M9YrkMMF+Uq0RP+tPJFQQ@mail.gmail.com>
 <55EB0258.5020904@openwide.fr>
 <CAAMcf8DcwuJvASF1A12hLSTKsyK3553CL5hv9dnPT+vrMwo9sA@mail.gmail.com>
Message-ID: <5609AA80.6040106@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

Le 27/09/2015 02:37, vj a ?crit :
> Hello Romain,
> this weekend I had some time to spend on this, sorry for the delay.

That's ok, I guess you're working on your free time :)

> 
> I've posted the EFL issue:
> http://sourceforge.net/p/enlightenment/mailman/message/34493376

Glad to see you had some help on your error on framebuffer support.
If you send me a git formated patch that fixes your issue, be sure it'll be part
of the next efl series. (I hope, in the meantime, a patch will be applied
upstream and backported to 1.15 stable branch before the 1.15.2 release).

> 
> And tested your efl-1.15.1-v1 branch from
> git://github.com/RomainNaour/buildroot.git
> Aside from the EFL workaround (-fvisibility=default) the only
> remaining issue is that when audio is disabled it fails to build
> because of bae9cf8354208bdad7780e0d11e5b4c8cf1b1f3e.
> I think it should be safe to just revert it because multisense is
> already enabled by default and (as an audio-related feature) it only
> makes sense when audio is also enabled.

Thanks for the testing and the feedback!
The last patches from efl-1.15.1-v1 branch are WIP and won't be included yet in
the next Buildroot series. I'll take a closer look to multisense stuff.

> 
> Regards,
>   Vicente.
> 
> Tested-by: Vicente Bergas <vicencb@gmail.com>
> 

I already added your tested-by tag in the commit that bump efl for the target.
https://github.com/RomainNaour/buildroot/commit/04b24bc4e9b9c21209cbdb1110d0ae41991f838d

Also, tags are not taken into account by patchwork when you reply to a cover
letter. You can send several tags on a specific patch on the series by replying
to the email.

Best regards,
Romain
