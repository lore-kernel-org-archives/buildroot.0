From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 1 Jul 2017 11:36:04 +0200
Subject: [Buildroot] [RFC PATCH v5 01/11] package/patchelf: use most
 recent version as a base for rpath sanitation
In-Reply-To: <5b16af39-81af-9a19-dd28-9aebfde9e817@grandegger.com>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <1498811828-6893-2-git-send-email-wg@grandegger.com>
 <80a1cf57-34bb-dc8f-e2b9-dd4001f7df6b@mind.be>
 <5b16af39-81af-9a19-dd28-9aebfde9e817@grandegger.com>
Message-ID: <2a8e734f-e6d7-0c7d-34f7-8b6a650fddb5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-06-17 19:33, Wolfgang Grandegger wrote:
> Am 30.06.2017 um 19:15 schrieb Arnout Vandecappelle:
>>
>>
>> On 30-06-17 10:36, Wolfgang Grandegger wrote:

[snip]
>>> -PATCHELF_LICENSE = GPL-3.0+
[snip]
>>> +PATCHELF_LICENSE = GPLv3+
>>
>>   This was not the intention I guess?
> 
> Well, that's the licence used for the new version:

 It was already the license of the old version, but we switched to SPDX license
strings and you reverted to the old custom way.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
