From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 13 Nov 2015 07:30:31 +0100
Subject: [Buildroot] [PATCH 2/2] configs/qemu: bump to the latest linux
 version
In-Reply-To: <20151113052422.GD21428@waldemar-brodkorb.de>
References: <1447151972-12086-1-git-send-email-gustavo@zacarias.com.ar>
 <1447151972-12086-2-git-send-email-gustavo@zacarias.com.ar>
 <20151112211421.GB21428@waldemar-brodkorb.de>
 <5645031D.5060405@zacarias.com.ar>
 <20151113052422.GD21428@waldemar-brodkorb.de>
Message-ID: <56458387.60103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13-11-15 06:24, Waldemar Brodkorb wrote:
> Hi Gustavo,
> Gustavo Zacarias wrote,
> 
>> On 12/11/15 18:14, Waldemar Brodkorb wrote:
>>
>>>> x86: stick to 4.2.x kernels since 4.3 doesn't work right with uclibc
>>>> (any variant) based toolchains.
>>>
>>> Can you elaborate on this?
>>> A quick build test worked fine for me.
>>> Or did you had any runtime issues?
>>
>> Hi Waldemar.
>> Just try to pull a dhcp address from the network interface.
>> Regards.
> 
> Fixed here:
> http://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?h=1.0&id=e89e3af8f64bded3920f046fb8db2b95a188ff55

 Care to send a buildroot patch that incorporates this?

 BTW, will non-ng uClibc still be broken? If so, how do we deal with that?
External uClibc toolchains will still not have the fix...

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
