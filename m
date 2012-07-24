From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 24 Jul 2012 17:54:15 +0200
Subject: [Buildroot] Qt on AM3517EVM
In-Reply-To: <CALo-6+j_ZrbQhRWE9vyLs2aWh=7Hm7r3+4qN8xSKbFtxOLbrEA@mail.gmail.com>
References: <CALo-6+hhvCkfT_4Rz4POqw5j_BPPLKHZ0saqEyeiKsp-tSJLdA@mail.gmail.com>
 <20120717093212.0c7d5415@skate>
 <CALo-6+hsekD6L5pZhmsZD_4mW0CQTLbearUxdr-F_HitXq5W9Q@mail.gmail.com>
 <20120719181109.481c2882@jl-desk-LL>
 <CALo-6+j_ZrbQhRWE9vyLs2aWh=7Hm7r3+4qN8xSKbFtxOLbrEA@mail.gmail.com>
Message-ID: <500EC527.8090606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/19/12 18:32, Charles Krinke wrote:
> But, what doesnt work is respawning the console as ttyO2 in inittab or
> $ echo "astring">  /dev/ttyO2

  You're not, by any chance, using a static /dev ?  ttyO2 is not in
target/generic/device_table_dev.txt I'm afraid...


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
