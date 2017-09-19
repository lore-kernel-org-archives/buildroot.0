From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Sep 2017 21:37:57 +0200
Subject: [Buildroot] [PATCH] qt: Allow enabling of QtWebKit with GCC 6+
In-Reply-To: <20170919091444.34950-1-didin@synopsys.com>
References: <20170919091444.34950-1-didin@synopsys.com>
Message-ID: <09d9ea71-4349-8fcb-7612-4c5075f7c8c5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Evgeniy,

 In addition to Thomas's comment:

On 19-09-17 11:14, Evgeniy Didin wrote:
> Building Qt with QtWebKit on configuration step there is
> a check which disables QtWebKit build with GCC 6+.
> Back in the day nobody thought about building Qt with GCC
> version greater than 5.x. And now with modern GCCs like
> 6.x and 7.x this assumption gets in the way.
> 
> Given in Buildroot today we don't have GCC older than 4.9 
> it should be safe to remove now meaningless check completely.

 We actually support GCC down to 4.3 in external toolchains. But the check is
only for 3.3 or older, so still OK.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
