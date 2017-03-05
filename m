From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 6 Mar 2017 00:34:33 +0100
Subject: [Buildroot] [PATCH v3 1/2] package/physfs: new package
In-Reply-To: <20170305234148.6e52939f@free-electrons.com>
References: <20170301225611.11494-1-romain.naour@gmail.com>
 <4328635a-2687-59f6-a192-4af579aafb58@gmail.com>
 <20170305215137.1600833e@free-electrons.com>
 <755ee979-57de-4718-9fa0-5f7de1f05289@gmail.com>
 <20170305223749.3567d0af@free-electrons.com>
 <c341646a-fe08-f349-cb46-aed8d0430639@mind.be>
 <20170305234148.6e52939f@free-electrons.com>
Message-ID: <2c9a5670-7187-8b50-f6cb-eafd707f8d2e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-03-17 23:41, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 5 Mar 2017 23:06:21 +0100, Arnout Vandecappelle wrote:
> 
>>  First of all, I don't see any 'or later' language, so it's LGPL2.1 (the version
>> mentioned in src/lzma/LGPL.txt).
>>
>>  I think the special cases are not interesting enough to warrant mentioning
> 
> Don't the special cases allow static linking more easily than what
> LGPL2.1 allows to do?

 Actually there is no "special cases", there is "special exception" (which I
included in my proposal, that you snipped away but I repeat it below), and there
is "proprietary license". Then there are some files that have a "public domain"
option, but since the package links with a whole lot more than just those files,
it's not relevant for the overall license.

 Therefore:

PHYSFS_LICENSE = zlib license (physfs), LGPLv2.1 with exceptions (lzma)


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
