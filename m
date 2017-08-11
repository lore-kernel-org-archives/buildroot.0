From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Aug 2017 15:38:00 +0200
Subject: [Buildroot] [PATCH 1/2] package/monolite: bump to version
 1050001000
In-Reply-To: <CA+TH9VkzS19L_bWGBaRaaVSRqkuuHRPXHoq-uCfm8ePaS9oN+g@mail.gmail.com>
References: <1502439245-18039-1-git-send-email-angelo.compagnucci@gmail.com>
 <44cbe2b5-2d53-9c66-15a3-5e3fbfa3b219@mind.be>
 <CA+TH9VkzS19L_bWGBaRaaVSRqkuuHRPXHoq-uCfm8ePaS9oN+g@mail.gmail.com>
Message-ID: <ccd40fe9-af68-42db-3b5c-8ac2d8ecdce2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-08-17 12:40, Angelo Compagnucci wrote:
> Dear Arnout Vandecappelle,
> 
> 2017-08-11 11:56 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
>>
>>
>> On 11-08-17 10:14, Angelo Compagnucci wrote:
>>> The latest version of mono carries a bit of changes in the monolite
>>> package: the version string changes and from now on, monolite should
>>> be installed in a subdirectory with the exact version string as a name.
>>
>>  And does this work independently of the version bump of mono itself? I.e., if
>> we apply just this patch, will mono still build?
> 
> Nope. The patches are sent in a series for the purpose to be both applied.
> 
>>  If not, then the two patches should be squashed. If you don't have time we can
>> do that while applying.
> 
> Sorry for the noise, but this is not how the things worked in the
> past. I was suggested several times in the past to send a patch for
> each modification/package.

 Yes, but only if they indeed work separately. Don't worry, I'll squash while
applying.

 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
