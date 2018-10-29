From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 29 Oct 2018 16:46:24 +0100
Subject: [Buildroot] Antwort: Re: Antwort: Re: [PATCH v3]
 merge_config.sh: merge also buildroot config files
In-Reply-To: <OF26A838D6.35610758-ONC1258332.00211513-C1258332.0021531B@local-dmz.de>
References: <20181025011343.29512-1-afshin.nasser@gmail.com>
 <20181025022031.14043-1-afshin.nasser@gmail.com>
 <20181025074309.GB18528@dell5510>
 <OF54A89E59.8DBA5497-ONC1258331.0034C458-C1258331.00357034@local-dmz.de>
 <20181025214311.GB31691@dell5510>
 <OF26A838D6.35610758-ONC1258332.00211513-C1258332.0021531B@local-dmz.de>
Message-ID: <20181029154623.GE14084@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

FYI: Masahiro Yamada (kconfig kernel maintainer) proposed [1] solution using env.
variable CONFIG_ (as it's already used in kconfig binary). I'm ok with it,
I propose to take upstream commit from kernel.


Kind regards,
Petr

[1] https://patchwork.kernel.org/patch/10658589/#22289439
