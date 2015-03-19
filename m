From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 19 Mar 2015 10:34:47 +0100
Subject: [Buildroot] Worried about patches not being merged?
In-Reply-To: <20150319101643.6a4eeed3@free-electrons.com>
References: <20150304232101.437af48f@free-electrons.com>
 <1426708866.1395.8.camel@embedded.rocks>
 <CA+TH9VmRWPdidNHSLArTek4Pxxtw+viOy7_tMbMYturnq0-VaQ@mail.gmail.com>
 <20150319101643.6a4eeed3@free-electrons.com>
Message-ID: <CA+TH9Vm9myq5YS_3+CsvT5-SZXcGyug3KDUO0Ai8f+daMf6BYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

2015-03-19 10:16 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Angelo,
>
> (Please don't use top-posting, top-posting is bad.)

Sorry for the top post, it was a mistake.

> On Thu, 19 Mar 2015 09:35:31 +0100, Angelo Compagnucci wrote:
>
>> The first on is the impossibility to prioritize patches to be
>> reviewed. Nobody really cares to go to months old threads only to find
>> an important patch passed unobserved. We should have a way to tag that
>> patch as high/low priority just at the time of arrival, so reviewers
>> could choose in a pool of important patches. This way the project
>> could add important features and bug fixes more easily.
>> To me, it's not that important that my new shiny sysdig package will
>> enter buildroot in a couple of major releases, it's more important to
>> have the makedevs recursive option applied cause it's really a killer
>> feature (this is only an example from my backlog).
>
> Indeed, patchwork could offer more features to "classify" patches.
> There are some big series like the SELinux stuff or the per-package
> staging directory that are really "advanced/in-progress" work that
> isn't at the same level as many other patches in the list.
>
> Patchwork is an open-source project, the code base is pretty small and
> easy, so feel free to contribute improvements!

Why not, I will try to take a look, I'm really acquainted to web
programming with various web frameworks.

>> The second one is to have the ability to comment patches directly on
>> web. Nobody wants to dig his email client looking for that two months
>> old thread to be reviewed. Having a simple way to comment on web could
>> accelerate patch review considerably, cause I can filter patches
>> matching a certain criteria and review them one by one. I can choose
>> to review patches from older to younger, or patches that pertain to my
>> field of knowledge.
>
> On this one however I believe you'll face the opposition of many of the
> old timers, who are very much used to e-mail based review. I do think
> that e-mail based review encourages more people to review because
> everyone gets to see the review e-mails, it's not buried deep in an
> obscure web interface.

Absolutely! What I'm saying is that having a way to post comments on
patches directly from web it's easier than dig into really old
threads, especially if your patches becomes categorized and ordered.
Obviously, the email based workflow must stay in place.

> And anyway, what are the available options? The Gerrit web interface is
> absolutely terrible, it's a huge mess of buttons/links all over the
> place, totally unusable IMO.

I totally hate all that it's not email based. Pull requests are
absolutely terrible, and complicating things like in gerrit will move
away users.

> What you could do however, since patchwork has the complete e-mails, is
> create a "Reply" button next to each patch in patchwork, that would
> open up the patch and format a reply to it so that you can review the
> patch.

Yes, this is exactly what I'm thinking. I'm making some experiments
with http://getbarkeep.org, it's email based and has really a nice
review system, get a look at the video. Patchworks should offer
something similar.

> This would at least simplify the process of finding back in your
> e-mail client the relevant e-mail (which, to be honest, isn't that
> complicated: just copy/paste the Subject of the patch as given by
> patchwork into your e-mail client, and it'll return you just that one
> patch).
>
> Also, often people complaining about e-mail and wanting to use
> web-based stuff instead is because their e-mail client or e-mail setup
> in general sucks. Do you have a good and efficient e-mail client? If
> you don't, then the issue might be here.

Gmail is a good email client, no problems here. But if our mail
clients are easy to use, why there are patches as old as February
2014?

Sincerely, Angelo.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
