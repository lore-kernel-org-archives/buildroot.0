From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 03 Jul 2012 00:09:23 +0200
Subject: [Buildroot] [PATCH v2 1/3] pkg-infra: add XXXTARGETS_HOST macro
In-Reply-To: <20120702103941.2fbdf947@skate>
References: <1341090872-12266-1-git-send-email-arnout@mind.be>
 <20120702103941.2fbdf947@skate>
Message-ID: <4FF21C13.2020503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/02/12 10:39, Thomas Petazzoni wrote:
> Hello,
>
> Le Sat, 30 Jun 2012 23:14:32 +0200,
> "Arnout Vandecappelle (Essensium/Mind)"<arnout@mind.be>  a ?crit :
>
>> Create GENTARGETS_HOST, AUTOTARGETS_HOST and CMAKETARGETS_HOST
>> macro.  Such a macro is more intuitive to use than the
>> $(call ...,host) construct.  Also it speeds things up by having
>> one less $(call ...) evaluation.
>>
>> Also includes documentation update, but not for buildroot.html.
>>
>> This brings the time for 'make -qp' (which is used by bash-completion)
>> down from 1.85s to 1.35s on my laptop.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>
>
> Sounds good, but didn't we agree on a different name for the package
> macros? Or maybe your intention is to first get this cleanup done, and
> then do the renaming?

  Completely forgot about that... v3 has the renaming.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
