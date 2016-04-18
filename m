From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Apr 2016 01:18:36 +0200
Subject: [Buildroot] [PATCH] [RFC] U-Boot: don't check hashes for U-Boot
 external patches
In-Reply-To: <5714B6C2.6020204@free.fr>
References: <1460644321-13849-1-git-send-email-julien.boibessot@free.fr>
 <57100509.8040804@mind.be> <57100ABB.8090206@mind.be>
 <5714B6C2.6020204@free.fr>
Message-ID: <57156B4C.9090203@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/18/16 12:28, Julien Boibessot wrote:
> Hello,
>
> Arnout,
>
> thanks for the comments.
>
> On 14/04/2016 23:25, Arnout Vandecappelle wrote:
[snip]
>>
>>   Oh, and something similar should be done for LINUX_PATCH as well.
>
> LINUX_PATCH is already working well with external patches that have to
> be downloaded.

  Of course, because we don't have a linux.hash and probably never will have one.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
