From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 24 Aug 2015 21:44:19 +0200
Subject: [Buildroot] [PATCH] package: add comment about ipkg/opkg/rpm
In-Reply-To: <20150823094750.GC3729@free.fr>
References: <1440085901-24479-1-git-send-email-yann.morin.1998@free.fr>
 <55D8FA56.5020009@mind.be> <20150823094750.GC3729@free.fr>
Message-ID: <55DB7413.4060109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/23/2015 11:47 AM, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2015-08-23 00:40 +0200, Arnout Vandecappelle spake thusly:
[snip]
>>
>>  Don't know how important this is, but on a 80-character display it gets chopped
>> off after the faq-no-. But I guess there's not much we can do about it.
>> Except perhaps: http://nightly.buildroot.org/manual.html#faq-no-binary-packages
>> - still doesn't fit but at least we get to the binary-pa :-)
> 
> What about;
> 
>     comment "-----------------------------------------------------"
>     comment "Please note:                                         "
>     comment "- Buildroot does *not* generate binary packages,     "
>     comment "- Buildroot does *not* install any package database. "
>     comment "*                                                    "
>     comment "It is up to you to provide those by yourself if you  "
>     comment "want to use any of those package managers.           "
>     comment "*                                                    "
>     comment "See the manual:                                      "
>     comment "http://buildroot.org/downloads/manual/manaul.html#faq"
>     comment "-no-binary-packages                                  "
>     comment "-----------------------------------------------------"
> 
> This does fit on a 80-char wide terminal, and we get the complete URL on
> two lines.

 ... which is also not ideal, since it means that the URL can't be copy&paste'd
easily, and that people with a modern terminal that is more than 80 characters
wide can't ctrl-click (or whatever) to open the URL directly.

 So I think it's best to use the slightly shorter nightly URL and keep it
non-wrapped.

 Or actually, it's best to add a manual.html -> downloads/manual/manual.html
symlink to the website and refer to that. This fits easily:
http://buildroot.org/manual.html#faq-no-binary-packages
And it also makes it easier for us to refer to the manual in other places.

 Peter, what do you think of such a symlink?


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
