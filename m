From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Oct 2012 15:05:52 +0200
Subject: [Buildroot] [PATCH 01/10] manual: add section about storing the
 configuration.
In-Reply-To: <5084321B.60701@relinux.de>
References: <1350776731-8467-1-git-send-email-arnout@mind.be>
 <1350776731-8467-2-git-send-email-arnout@mind.be> <5084321B.60701@relinux.de>
Message-ID: <50869630.6020703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/10/12 19:34, Stephan Hoffmann wrote:
> Am 21.10.2012 01:45, schrieb Arnout Vandecappelle (Essensium/Mind):
>> +Once you have a known working configuration, run +make
>> +savedefconfig+. This will generate a minimal +defconfig+ file at the
>> +root of the Buildroot source tree. Move this file into the +configs/+
>> +directory, and rename it +<boardname>_defconfig+.
> Hello all,
>
> so we will end with a nice tree of hopefully many
> board/<manufacturer>/<boardname>  folders containig special settings for
> each board, most likely at least a kernel config file. I don't expect
> that too many boards will do without other settings but those in
> buildroot's defconfig. And we will have many<boardname>_defconfig files
> in the configs folder.
>
> Wouldn't it make more sense to move buildroot's<boardname>_defconfig
> files to the respective board folder, so that everything would be
> together in one place?

  I fully agree, but I think we should first get these clean-ups committed
before considering that.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
