From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Nov 2017 23:39:57 +0100
Subject: [Buildroot] [PATCH 1/1] ntp: add patch to support for libressl
In-Reply-To: <20171123232952.3defa400@windsurf.lan>
References: <20171108121143.5411-1-aduskett@gmail.com>
 <20171123225155.73a4da45@windsurf.lan>
 <9d7c2e3e-7bad-128b-a915-d0f73f3c126c@mind.be>
 <20171123232952.3defa400@windsurf.lan>
Message-ID: <ddefae5d-0639-ac78-10c2-bca79dd136a0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-11-17 23:29, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 23 Nov 2017 23:27:18 +0100, Arnout Vandecappelle wrote:
> 
>>> Arnout, Peter, Yann, I think we discussed this topic during the
>>> Buildroot meeting, and concluded we didn't want patches in Buildroot to
>>> enable LibreSSL compatibility with a package. Do we stand on this
>>> position, and reject Adam's contribution on ntp?  
>>
>>  I don't think the conclusion was that we would reject patches to enable
>> LibreSSL compatibility outright, only:
>>
>>>   
>>>> + #ifndef OPENSSL_VERSION_NUMBER
>>>> ++#ifndef LIBRESSL_VERSION_NUMBER  
>>>
>>> In addition, this continue to use the LIBRESSL_VERSION_NUMBER approach,
>>> which will fail when libressl gains support for new APIs.  
>>
>>  we would reject this approach because I believe it is not upstreamable.
>>
>>  I think upstreamable patches are acceptable. And maybe even the
>> LIBRESSL_VERSION_NUMBER approach is OK - but then I first want to see a reliable
>> upstream accept it.
> 
> The issue here is that Adam has submitted the patch upstream a while
> ago (see bugs.ntp.org/show_bug.cgi?id=3401#c3), and upstream has
> reacted.

 Maybe I missed something, but I don't see the reaction?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
