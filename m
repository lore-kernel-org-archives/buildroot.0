From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 18 Feb 2013 17:08:19 +0100
Subject: [Buildroot] multchoice menu with kconfig
In-Reply-To: <5122506E.8030008@petroprogram.com>
References: <5122315C.3070806@petroprogram.com> <512249D5.5020107@mind.be>
 <51224C88.4020108@petroprogram.com> <51224F93.9060102@mind.be>
 <5122506E.8030008@petroprogram.com>
Message-ID: <512251F3.7060101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/02/13 17:01, Stefan Fr?berg wrote:
> And because this iso-codes package does not seem to have nothing but
> punch .po files
> and not link against anything then changing that ISO_CODES_DEPENDENCIES
> to host-gettext should be good.

  Err... But iso-codes doesn't need host-gettext, does it? It probably 
doesn't make much sense without locale support in the toolchain, but 
otherwise I see no dependencies except python (which is already a 
buildroot dependency).


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
