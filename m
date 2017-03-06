From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 6 Mar 2017 17:41:48 +0100
Subject: [Buildroot] [PATCH 1/1] dc3dd: new package
In-Reply-To: <20170306165720.28face21@armant.office.greenbone.net>
References: <1488607456-30096-1-git-send-email-benoit.allard@greenbone.net>
 <043238f2-3640-b9c7-c86b-28c31e8c44d5@mind.be>
 <20170306165720.28face21@armant.office.greenbone.net>
Message-ID: <4dccae11-d7e8-1dd8-2797-1336326fa392@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-03-17 16:57, Beno?t Allard wrote:
> On Fri, 3 Mar 2017 23:42:49 +0100
> Arnout Vandecappelle <arnout@mind.be> wrote:
[snip]
>>> +DC3DD_VERSION = 7.2.646
>>
>>  There is a version 7.2.641 which is identical except that it has an
>> older (!) Changelog, and a different version number...
>>
>>> +DC3DD_SOURCE = dc3dd-$(DC3DD_VERSION).zip
>>
>>  and that version has a proper tar.xz.
> 
> Indeed, I will use that older version.

 Please mention in the commit log that they are identical and why we prefer the
"older" one.

>>> +DC3DD_SITE = http://downloads.sourceforge.net/project/dc3dd/dc3dd/$(DC3DD_VERSION)/dc3dd%20$(DC3DD_VERSION)
>>> +DC3DD_LICENSE = GPLv3
>>
>>  I didn't do a full fossology but it looks like all files have the
>> 'or later' clause, so it's GPLv3+
> 
> You are correct, most files have indeed the 'or later' mention.

 Can you please double-check that *all* files mention 'or later'? At least the
ones that do have a copyright header. We don't want to be lying.


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
