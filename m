From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Apr 2013 19:02:34 +0200
Subject: [Buildroot] Adding local file system overlay
In-Reply-To: <6119D107D82B0940B389FAED3F2DDE6616222E08@Ansuz.hms.se>
References: <6119D107D82B0940B389FAED3F2DDE6616222D57@Ansuz.hms.se>
 <1768202256.1976834.1366961616672.JavaMail.root@openwide.fr>
 <6119D107D82B0940B389FAED3F2DDE6616222E08@Ansuz.hms.se>
Message-ID: <517AB32A.9090508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/04/13 10:48, Lars Dunemark wrote:
>> doesn't buildroot already do that ?
>>
>> system configuration => overlay directory
>>
>> or is your patch doing something different
> Currect Buildroot has this functionality but this requires me to update the configuration for my build target.
>
> My suggestion is to allow this without configuration changes, making it possible to alternate a build on your local machine without risking getting it in the default configuration for that target when doing make savedefconfig.

  You can always override any configuration option on the command line:

make BR2_ROOTFS_OVERLAY=...


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
