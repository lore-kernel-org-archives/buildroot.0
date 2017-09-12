From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Sep 2017 09:47:41 +0200
Subject: [Buildroot] [PATCH v2 05/11] package/glibc: needs kernel
 headers >= 3.10 on powerpc64le
In-Reply-To: <20170912060419.GA3625@scaer>
References: <20170902205423.21288-1-romain.naour@gmail.com>
 <20170902205423.21288-6-romain.naour@gmail.com> <20170910103032.GF3536@scaer>
 <ef182f62-d373-945b-c212-e5483c6d97a1@mind.be>
 <20170912013726.474d54e8@windsurf> <20170912060419.GA3625@scaer>
Message-ID: <7a8b6931-13e1-7057-6024-88c05cb574f4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-09-17 08:04, Yann E. MORIN wrote:
> Thomas, Arnout, All,
> 
> On 2017-09-12 01:37 +0200, Thomas Petazzoni spake thusly:
>> On Tue, 12 Sep 2017 01:05:18 +0200, Arnout Vandecappelle wrote:
>>> 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 if BR2_powerpc64le
>> "depends on ... if ..." is not a valid Kconfig construct if I remember
>> correctly.
> 
> Indeed it is not.

 D'oh, right, it's "select ... if ...".

 Sorry for the noise.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
