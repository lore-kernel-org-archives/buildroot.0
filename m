From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Sep 2017 01:05:18 +0200
Subject: [Buildroot] [PATCH v2 05/11] package/glibc: needs kernel
 headers >= 3.10 on powerpc64le
In-Reply-To: <20170910103032.GF3536@scaer>
References: <20170902205423.21288-1-romain.naour@gmail.com>
 <20170902205423.21288-6-romain.naour@gmail.com> <20170910103032.GF3536@scaer>
Message-ID: <ef182f62-d373-945b-c212-e5483c6d97a1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-09-17 12:30, Yann E. MORIN wrote:
>     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le

 I find

	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 if BR2_powerpc64le

easier to grok.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
