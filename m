From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 6 Mar 2017 00:35:54 +0100
Subject: [Buildroot] [PATCH] odroid-mali: mark package as BROKEN
In-Reply-To: <20170305234052.2515068d@free-electrons.com>
References: <1488638059-6764-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170305213723.021d4678@free-electrons.com>
 <b81cad7b-504e-b927-3f62-844925aba881@mind.be>
 <20170305234052.2515068d@free-electrons.com>
Message-ID: <746ac932-fe6d-bbe0-0b87-b17fc76810af@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-03-17 23:40, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 5 Mar 2017 23:33:56 +0100, Arnout Vandecappelle wrote:
> 
>>  I'm obviously late with commenting on this, but I think marking things as
>> BROKEN is wrong. It bypasses the legacy mechanism so it disappears without
>> notice. Also, BROKEN packages languish there for years without ever anyone
>> taking a look. Sometimes things do get repaired, but re-adding the package is
>> not much more complicated than
>>
>>  So, I propose to remove all broken packages.
>>
>>  [I have the feeling we discussed this kind of thing at some BR devel meeting at
>> some point, but I can't find it.]
> 
> True. But for this one case, the developer contributing the package is
> still active, submitting patches for other things from time to time. So
> I was hoping that a stronger hint at "please fix your packages
> otherwise they'll get removed" was in order.

 I think an outright removal (with the original contributors in Cc) is an
equally strong incentive.

> 
> Let's say that we'll remove this package before the 2017.05 release if
> nobody unbreaks it?

 And what with the 6 other packages (or package options) marked as broken? Can
we kill it?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
