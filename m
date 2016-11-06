From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 6 Nov 2016 13:11:37 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-11-04
In-Reply-To: <20161106115258.0ceb20c5@free-electrons.com>
References: <20161105073056.4969320D86@mail.free-electrons.com>
 <df36574f-bff9-b295-2a82-825a13894f58@gmail.com>
 <df69f5f2-2881-d4b9-759a-3c2f4bcf7192@mind.be>
 <20161106104106.GA3367@free.fr> <20161106115258.0ceb20c5@free-electrons.com>
Message-ID: <2c61512a-5c2e-d17b-848a-46323ca437df@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-11-16 11:52, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 6 Nov 2016 11:41:06 +0100, Yann E. MORIN wrote:
> 
>>>  If we want to be on the safe side, we can just do that bit in
>>> TVHEADEND_BUILD_CMDS to override the global locale.  
>>
>> Yep, that works. I'll send a patch. Thanks for the hints! :-)
> 
> Are we sure that C.UTF-8 will always be available on the build machine?
> Note how support/dependencies/dependencies.sh has a check to verify
> that at least one utf8 locale is installed when the user when to build
> a uClibc toolchain with locales? This clearly indicates that we had
> some situations where no utf8 locale was available on the host machine.

 On my Debian machine, /usr/lib/locale/C.UTF-8 is part of libc-bin so it's
always there.

 For the other locales, I think they come from the locales package, which is
just "standard", not "required", so not always installed.

 Regards,
 Arnout


> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
