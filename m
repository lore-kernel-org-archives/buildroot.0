From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Oct 2018 23:30:39 +0200
Subject: [Buildroot] Analysis results for 2018-10-09
In-Reply-To: <20181010174814.5ac114f1@windsurf>
References: <20181010060010.4E3C920736@mail.bootlin.com>
 <20181010174814.5ac114f1@windsurf>
Message-ID: <5c66f02e-d2f1-55a6-c75f-6a924e6b70bd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/10/18 17:48, Thomas Petazzoni wrote:
>>     mips64el |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/ab39280ceaf967e08abfd1f51efa4613495237f5 | ORPH
> 
> gstspanplc.c:223:21: error: dereferencing pointer to incomplete type 'plc_state_t {aka struct plc_state_s}'
>    if (plc->plc_state->missing_samples != 0)

 Perhaps it's time to retire gstreamer-0.10? Is anybody still using it?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
