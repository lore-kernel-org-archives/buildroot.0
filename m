From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Fri, 07 Mar 2014 21:52:16 +0100
Subject: [Buildroot] [PATCH 2/2] exim: new package
References: <1394124890-29254-1-git-send-email-luca@lucaceresoli.net>
 <1394124890-29254-3-git-send-email-luca@lucaceresoli.net>
 <heomuaxdgh.ln2@ID-313208.user.individual.net>
 <5319DD64.9000701@lucaceresoli.net>
Message-ID: <05opuax7o6.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Hi,

Luca Ceresoli <luca@lucaceresoli.net> wrote in
news:5319DD64.9000701 at lucaceresoli.net: 

> Bernd Kuhls wrote:
>> Hi,
>>
>> Luca Ceresoli <luca@lucaceresoli.net> wrote in
>> news:1394124890-29254-3-git-send-email-luca-ep08DiM7hqZH3+C6az13tg at publi
>> c.gmane.org: 
>>
>>> --- a/package/Config.in
>>> +++ b/package/Config.in
>>> @@ -834,6 +834,7 @@ source "package/dnsmasq/Config.in"
>>>   source "package/dropbear/Config.in"
>>>   source "package/ebtables/Config.in"
>>>   source "package/ethtool/Config.in"
>>> +source "package/exim/Config.in"
>>
>> what about creating a new section "Mail applications"?
> 
> I don't think we have a large enough number of mail-related packages in
> Buildroot to justify such a section. But I may be wrong.

I am planning to add the following packages to buildroot in addition to 
exim:

- fetchmail
- dovecot
- dovecot-pigeonhole

Currently the following mail-related packages are included in buildroot, 
both in "Networking applications", and could be moved to the new section:
- libesmtp
- msmtp

This makes 6 packages in total. I do not know how many packages are needed 
to justify a new section, therefore I am asking before sending patches ;)

Regards, Bernd
