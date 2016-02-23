From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Feb 2016 01:13:49 +0100
Subject: [Buildroot] [PATCH] msr-tools: new package
In-Reply-To: <CAGm1_kuNhAYrMRf_T3FU5gCoYYT72nEm=MeTRWkdo9FrYjK9-g@mail.gmail.com>
References: <1454087465-23445-1-git-send-email-vincent.stehle@intel.com>
 <CAGm1_kuNhAYrMRf_T3FU5gCoYYT72nEm=MeTRWkdo9FrYjK9-g@mail.gmail.com>
Message-ID: <56CBA43D.8080908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/22/16 15:40, Yegor Yefremov wrote:
> Config.in is missing a depends message like this:
> 
> comment "msr-tools runs only on x86 CPUs"
>         depends on !BR2_i386 && !BR2_x86_64

 Actually, no: we don't add architecture dependencies. The user can't change his
configuration to a different architecture to be able to select the package, so
the comment isn't much use.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
