From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Sep 2012 09:13:30 +0200
Subject: [Buildroot] [PATCH] qtuio: new package
In-Reply-To: <504FAF69.5060004@mind.be>
References: <1346328506-27403-1-git-send-email-sho@relinux.de>
 <504FAF69.5060004@mind.be>
Message-ID: <5050361A.80601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/11/12 23:38, Arnout Vandecappelle wrote:
>> +comment "QT libraries and helper libraries"
>> +source "package/qtuio/Config.in"
>> +
>
>   Put this before x11r7.

  Actually, I'd also prefer this (both comment and source lines) to
be wrapped in a "if BR2_PACKAGE_QT".

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
