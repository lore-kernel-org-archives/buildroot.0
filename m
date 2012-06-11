From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 11 Jun 2012 23:22:58 +0200
Subject: [Buildroot] [PATCH] added package sftpserver
In-Reply-To: <CABJxTWFdYodgaKy3vG03aJrxnerCrxTsjRPWm1q8U_XkQukz0w@mail.gmail.com>
References: <CABJxTWFdYodgaKy3vG03aJrxnerCrxTsjRPWm1q8U_XkQukz0w@mail.gmail.com>
Message-ID: <4FD661B2.7050404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/04/12 09:26, Kiril Maler wrote:
> 1. It is more intuitive for a developer configuring a small embedded
> system to see
> the sftp-server under dropbear ssh suite:

  Wouldn't it be even better to add the sftpserver feature to buildroot, reusing the
openssh implementation?  Or would there be a license issue?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
