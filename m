From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Feb 2016 01:40:38 +0100
Subject: [Buildroot] [PATCH 1/3] vala: add vala/valac wrapper
In-Reply-To: <56CBA547.3020200@zacarias.com.ar>
References: <1454428908-7183-1-git-send-email-gustavo@zacarias.com.ar>
 <20160221222816.4e53e921@free-electrons.com> <56CA62D8.10309@zacarias.com.ar>
 <56CB9DFA.506@mind.be> <56CBA547.3020200@zacarias.com.ar>
Message-ID: <56CBAA86.4070305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/23/16 01:18, Gustavo Zacarias wrote:
> On 22/02/16 20:47, Arnout Vandecappelle wrote:
> 
>>   Hi Gustavo,
> 
> Hi.
> 
>>> However my patience is wearing quite thin and i'm very tempted to just let
>>> everything stale, we're about to ship another release with non-existant
>>> gtk3-wayland support again, a feature that was working just fine a few releases
>>> ago.
>>
>>   I'm not sure what your message is here. Do you mean that it's problematic that
>> we have 291 patches left in patchwork, just after Thomas did about 70 commits? I
>> think we all agree on that, so if you have a solution, please let us know. Or do
>> you mean that we should just apply your patches without review? Or are you
>> complaining that of the 365 patches you submitted since 2015.11, only 338 were
>> merged up to now?
> 
> I was asked to step in and maintain webkitgtk, gtk3 & accesory packages.
> And this has been sitting in patchwork for quite some time with no comments or
> anything and rotting down (this = the gtk3 bump and other pieces that depend on
> it).
> It means i'll just take is as there's no interest and just leave it rot
> completely - i didn't pick this up because it's something i use or have any
> particular interest in.

 I think you should take it as: between the 291 - sorry, 300 by now - other
patches, this series has been overlooked. Again, if you have ideas that can help
to reduce the backlog from 300 to, say, 30: everybody will be glad to hear it!
Well, except if your idea is to stop sending patches of course.

> If you're implying i don't help in other aspects and i just care about what i
> send i suggest you take a look at lots of autobuilder fixes for packages i never
> use.

 That's why I mentioned that 92% of the patches you submitted have already been
applied. The other buildroot contributors really appreciate the work you do. And
share your frustration that too many patches tend to linger, and need to be
rebased all the time. In fact, Thomas and Peter have the additional frustration
that all of their time is taken up by applying other people's patches, leaving
no time to work on their own ideas.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
