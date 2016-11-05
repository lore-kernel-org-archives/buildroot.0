From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 5 Nov 2016 15:40:47 +0100
Subject: [Buildroot] [PATCH 3/3] snowball-{hdmiservice,
 init}: remove packages
In-Reply-To: <20161105145543.798906f8@free-electrons.com>
References: <1478352758-28778-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1478352758-28778-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <1d4b32b4-f3a9-9349-18dc-ddea93d8a52c@mind.be>
 <20161105145543.798906f8@free-electrons.com>
Message-ID: <a0572c0e-6f2a-9fba-979d-69cc8e53d110@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-11-16 14:55, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 5 Nov 2016 14:48:16 +0100, Arnout Vandecappelle wrote:
> 
>>> +config BR2_PACKAGE_SNOWBALL_HDMISERVICE
>>> +	bool "snowball-hdmiservice removed"
>>> +	select BR2_LEGACY
>>> +	help
>>> +	  We no longer have support for the Snowball platform in
>>> +	  Buildroot, so this package was no longer useful.  
>>
>>  ... explain that here:
>>
>> 	  If you need this package, get it from the buildroot-2016.08
>> 	  tarball and put it in a BR2_EXTERNAL tree. You need to give the
>> 	  package a different name however.
>>
>>  Hm, that last bit makes it a bit complicated so perhaps adding such limited
>> information to the help text doesn't help a lot...
> 
> Well, we would have to add this message to pretty much each and every
> package being removed from Buildroot, so I find it rather pointless to
> have it specifically for those packages.

 In most cases of removed packages, there is no need for anyone to still use it
(otherwise we wouldn't remove it). We generally don't remove packages just
because they're unmaintained.

 But you do have a point that we'd have to repeat the same text several times.
So if I really want this, I should submit a patch to the manual that explains it
there. Which I won't :-)

 Regards,
 Arnout


> I'm pretty sure nobody uses Buildroot anymore for Snowball related
> stuff. The igloocommunity.org domain name is for sale, and it's really
> only because the source code is hosted on Github that it still survives.
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
