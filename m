From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 8 Apr 2017 15:35:03 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-04-07
In-Reply-To: <20170408062822.DB87E20847@mail.free-electrons.com>
References: <20170408062822.DB87E20847@mail.free-electrons.com>
Message-ID: <6309c1c4-169b-6c7b-53fe-631ddd7b7c73@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-04-17 08:28, Thomas Petazzoni wrote:
>         m68k |                   arp-scan-1.9 | NOK | http://autobuild.buildroot.net/results/c605c8cc36348f199a36e2652851b8d02ee222c0 |     

 Hm, looks like the elf2flt issue is not just for ARM, but also for m68k. Weird
that I didn't catch this when running test-pkg on arp-scan...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
