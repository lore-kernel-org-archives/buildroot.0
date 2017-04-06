From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 6 Apr 2017 12:50:52 +0200
Subject: [Buildroot] [PATCH 3/5] telit_evk_pro3_defconfig: remove broken
	defconfig
In-Reply-To: <CAHkwnC_M3=cTtes4_Qc3Jig2+Q7=eJ=A4WoNsRFomLWuwJ_kKw@mail.gmail.com>
References: <20170301083046.13226-1-arnout@mind.be>
 <20170301083046.13226-3-arnout@mind.be>
 <CAHkwnC_M3=cTtes4_Qc3Jig2+Q7=eJ=A4WoNsRFomLWuwJ_kKw@mail.gmail.com>
Message-ID: <f6a4dcf2-1bc2-537d-9ba9-bd12ad0f4fca@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Fabio,

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

 Any update on that kernel patch? The telit defconfig is still broken...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
