From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Aug 2015 10:30:55 +0200
Subject: [Buildroot] [PATCH] package: add comment about ipkg/opkg/rpm
In-Reply-To: <20150824203421.GF3619@free.fr>
References: <1440085901-24479-1-git-send-email-yann.morin.1998@free.fr>
 <55D8FA56.5020009@mind.be> <20150823094750.GC3729@free.fr>
 <55DB7413.4060109@mind.be> <20150824203421.GF3619@free.fr>
Message-ID: <55DC27BF.6000909@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/24/2015 10:34 PM, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2015-08-24 21:44 +0200, Arnout Vandecappelle spake thusly:
>> On 08/23/2015 11:47 AM, Yann E. MORIN wrote:
>>> On 2015-08-23 00:40 +0200, Arnout Vandecappelle spake thusly:
[snip]
>>  Or actually, it's best to add a manual.html -> downloads/manual/manual.html
>> symlink to the website and refer to that. This fits easily:
>> http://buildroot.org/manual.html#faq-no-binary-packages
>> And it also makes it easier for us to refer to the manual in other places.
>>
>>  Peter, what do you think of such a symlink?
> 
> At least, I'd like that.
> 
> Since I have access to the server, if Peter agrees, I can try to
> configure the apache server for that.
> 
> But note that this apache server also serves ulibc and busybox.

 Just do
ln -s downloads/manual/manual.html docs/website/manual.html
git add docs/website/manual.html

 It results in a dead link in our repo, but who looks at the docs/website
directory anyway?

 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
> 

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
