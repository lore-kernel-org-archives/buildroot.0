From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 1 Mar 2017 19:50:18 +0100
Subject: [Buildroot] [PATCH 3/5] telit_evk_pro3_defconfig: remove broken
	defconfig
In-Reply-To: <CAHkwnC_M3=cTtes4_Qc3Jig2+Q7=eJ=A4WoNsRFomLWuwJ_kKw@mail.gmail.com>
References: <20170301083046.13226-1-arnout@mind.be>
 <20170301083046.13226-3-arnout@mind.be>
 <CAHkwnC_M3=cTtes4_Qc3Jig2+Q7=eJ=A4WoNsRFomLWuwJ_kKw@mail.gmail.com>
Message-ID: <f6eae718-9ef5-b2f3-a93b-4e2fbb389797@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-03-17 17:28, Fabio Porcedda wrote:
> 2017-03-01 9:30 GMT+01:00 Arnout Vandecappelle (Essensium/Mind)
> <arnout@mind.be>:
>> This defconfig has been broken due to gcc5 for more than half a year,
>> and nobody stepped up to fix it. Remove it, as well as it board
>> directory.
> 
> Hi Arnout,
> sorry for the late response, today I've sent a patch to fix the build
> failure for barebox, tomorrow i will send a patch to update the linux
> kernel.

 OK, I've marked this patch as superseded in patchwork.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
