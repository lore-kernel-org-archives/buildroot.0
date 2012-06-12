From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Jun 2012 18:24:01 +0200
Subject: [Buildroot] [PATCH] added package sftpserver
In-Reply-To: <20120612141231.33c4ccb8@skate>
References: <CABJxTWFdYodgaKy3vG03aJrxnerCrxTsjRPWm1q8U_XkQukz0w@mail.gmail.com>
 <4FD661B2.7050404@mind.be> <20120612141231.33c4ccb8@skate>
Message-ID: <4FD76D21.3060906@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/12/12 14:12, Thomas Petazzoni wrote:
> Hello,
>
> Le Mon, 11 Jun 2012 23:22:58 +0200,
> Arnout Vandecappelle<arnout@mind.be>  a ?crit :
>
>> On 06/04/12 09:26, Kiril Maler wrote:
>>> 1. It is more intuitive for a developer configuring a small embedded
>>> system to see
>>> the sftp-server under dropbear ssh suite:
>>
>>    Wouldn't it be even better to add the sftpserver feature to buildroot, reusing the
>> openssh implementation?  Or would there be a license issue?
>
> What do you mean exactly? Adding sftpserver as a suboption of openssh?
> Something else?

  Sorry I wasn't very clear.

  If I understand correctly, the intention is to be able to use sftp with
dropbear.  Rather than hacking the compilation of openssh, it makes more
sense to extend dropbear with the sftp feature (by stealing code from
openssh).  So this isn't really a buildroot thing, but rather a dropbear
thing.  Given that dropbear already reuses some code from openssh, I don't
think it would be much of a problem for the dropbear developers.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
