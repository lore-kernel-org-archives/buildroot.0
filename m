From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 06 Nov 2012 23:59:03 +0100
Subject: [Buildroot] [PATCH v11 2/9] perl: new package
In-Reply-To: <6aub7k.9fm.ln@bernd-kuhls.de>
References: <1350652434-32020-1-git-send-email-francois.perrad@gadz.org>
 <1350652434-32020-2-git-send-email-francois.perrad@gadz.org>
 <upcp6k.3q9.ln@bernd-kuhls.de>
 <CAB0FRsvaWPoSfSOv1uyPjpzHMU4a_hxPF_jB4XEhuVUFg4KcSQ@mail.gmail.com>
 <50986270.4070804@mind.be> <20121106080812.4e7bd01a@skate>
 <6aub7k.9fm.ln@bernd-kuhls.de>
Message-ID: <50999637.1090305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/11/12 22:09, Bernd Kuhls wrote:
> Thomas Petazzoni<thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
> @public.gmane.org>  wrote in news:20121106080812.4e7bd01a at skate:
>
>> I guess this whole qemu thing for Perl is going to be annoying on the
>> long term. We might need to start looking for a different option, i.e
>> seeing how to get Perl to build without needing qemu.
>
> Hi,
>
> maybe this can be of help: http://perlcross.berlios.de/

  That sounds like a terrific idea!  Do you feel up to integrating this in
buildroot and sending a patch?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
