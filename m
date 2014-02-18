From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Feb 2014 13:03:00 +0100
Subject: [Buildroot] [PATCH v2 1/1] manual: add virtual package tutorial.
In-Reply-To: <20140218114448.GB6731@pc-eric>
References: <1392390673-30343-1-git-send-email-eric.le.bihan.dev@free.fr>
 <530244B7.402@mind.be> <20140218114448.GB6731@pc-eric>
Message-ID: <53034BF4.40701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/02/14 12:44, Eric Le Bihan wrote:
>>  To make it easier for the reader to distinguish between them, perhaps it
>> > would be better to the virtual package V and the provider package P.
> Do you mean using BR2_PACKAGE_HAS_V instead of BR2_PACKAGE_HAS_FOO and so on?
> FOO and BAR/BAZ are already used in other parts of the manual and single
> letter package names look strange to me. They also make a better distinction
> between the prefix of the symbol and the name of the package.

 FOO BAR BAZ are OK to use when the names are meaningless. Here it would
be better if the package name would embed the role that the package plays
in the explanation. But I admit that V and P are a bit short. I wanted to
avoid VIRTUAL and PROVIDER because that sounds too much as if that prefix
is part of the infrastructure.

 Maybe something-virtual and some-provider.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
