From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Nov 2016 13:40:29 +0100
Subject: [Buildroot] [PATCH next 2/2] bash: bump version to 4.4
In-Reply-To: <20161129122404.59676-2-Vincent.Riera@imgtec.com>
References: <20161129122404.59676-1-Vincent.Riera@imgtec.com>
 <20161129122404.59676-2-Vincent.Riera@imgtec.com>
Message-ID: <20161129134029.25a9a847@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Nov 2016 12:24:04 +0000, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Notes to maintainer
>  - This new version contains a small security fix. From
>    http://tiswww.case.edu/php/chet/bash/NEWS:
> 
>    "Shells running as root no longer inherit PS4 from the environment,
>    closing a security hole involving PS4 expansion performing command
>    substitution."
> 
>    However, taking into account that bash is a critical package and the
>    2016.11 release is very close I've marked this patch as "next".

"is a critical package" or "is *NOT* a critical package" ? If it's a
critical package like you suggest, then perhaps we want it in master
anyway ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
