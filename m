From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 16 Feb 2013 18:35:14 +0100
Subject: [Buildroot] [PATCH] Docu: Add LIBFOO_EXTRACT_CMDS
In-Reply-To: <511FB25D.3040408@relinux.de>
References: <1359453890-23460-1-git-send-email-sho@relinux.de>
 <CAHXCMM+zLhKOZaz9YAw=s147nSOBgP-WUAOFWhjaNafbjAQ4TA@mail.gmail.com>
 <5107A6EE.3060607@relinux.de> <510806E9.9060504@mind.be>
 <511FB25D.3040408@relinux.de>
Message-ID: <511FC352.6050000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/02/13 17:22, Stephan Hoffmann wrote:
> Am 29.01.2013 18:29, schrieb Arnout Vandecappelle:
>> On 29/01/13 11:39, Stephan Hoffmann wrote:
>>> Am 29.01.2013 11:18, schrieb Samuel Martin:
>> [snip]
>>>>>>> +* +LIBFOO_EXTRACT_CMDS+ lists the actions to be performed to
>>>>>>> +  extract the package in case no standard method applies
>>>>> It could be nice to add what are the standard/supported methods
>>> Sure. But I do not know them, I just decided to document this one
>>> because I had to search for the information recently.
>>
>>   There is currently only one: tar - and if you don't override the
>> commands, tar is used regardless of filetype or extension.
>>
>>   It supports three compression types: gzip (extension .gz or .tgz),
>> bzip2 (extension .bz2, .tbz or .tbz2), and xz (extension .xz).
>>
>>   Feel free to copy the above directly :-)
>>
> I do not think that the list of XXX_CMDS variables is the right place to
> document the default behavior without them.
>
> Of course whe should have a documentation of the default behaior
> somewhere in the manual, but I am not enough familiar with this topic to
> write it.
>
> So I suggest to commit my patch as it is, it still applies to HEAD.

  Good point.

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
