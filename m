From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 06 Oct 2012 14:17:08 +0200
Subject: [Buildroot] [PATCH v8 03/11] perl: add an option for miniperl
In-Reply-To: <20121004224112.4c46e707@skate>
References: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
 <1348593508-14254-3-git-send-email-francois.perrad@gadz.org>
 <20121004224112.4c46e707@skate>
Message-ID: <50702144.6020503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/10/12 22:41, Thomas Petazzoni wrote:
> Fran?ois,
>
> On Tue, 25 Sep 2012 19:18:19 +0200, Francois Perrad wrote:
>
>> diff --git a/package/perl/perl-install-miniperl.patch b/package/perl/perl-install-miniperl.patch
>> new file mode 100644
>> index 0000000..7e6f8e6
>> --- /dev/null
>> +++ b/package/perl/perl-install-miniperl.patch
>> @@ -0,0 +1,129 @@
>> +Add an option -miniperl
>> +
>> +Signed-off-by: Francois Perrad<francois.perrad@gadz.org>
>
> Does this (fairly long) patch has a chance of being merged upstream? If
> not, then I'd prefer if we simply didn't support miniperl.

  I don't agree.  There is definitely a need for a non-bloated perl in buildroot.
So if microperl is on its way out, this patch is needed even if upstream doesn't
accept it.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
