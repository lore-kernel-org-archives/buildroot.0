From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Oct 2018 23:54:51 +0200
Subject: [Buildroot] Analysis results for 2018-10-09
In-Reply-To: <20181010174814.5ac114f1@windsurf>
References: <20181010060010.4E3C920736@mail.bootlin.com>
 <20181010174814.5ac114f1@windsurf>
Message-ID: <8d35a3cc-c12e-be36-130a-7cdbf5e93a61@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/10/18 17:48, Thomas Petazzoni wrote:
>>          arm |                     php-7.2.10 | NOK | http://autobuild.buildroot.net/results/7b7e25bfd269f7c252d15ab4e9f1b68348823478 | ORPH
> multiple definition of `icu_60::MessageFormatAdapter::getArgTypeList(icu_60::MessageFormat const&, int&)'
> 
> Long standing issue. Anyone brave enough to investigate ?

 Maybe just make php !STATIC?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
