From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Mar 2019 09:08:38 +0100
Subject: [Buildroot] [PATCH] package/kexec: enable powerpc64 platform
In-Reply-To: <878sx2lnbt.fsf@dell.be.48ers.dk>
References: <20190218121508.htf6s7bazcggmozg@gmail.com>
 <878sx2lnbt.fsf@dell.be.48ers.dk>
Message-ID: <20190327090838.7595b6cd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Mar 2019 21:18:46 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Artem" == Artem Senichev <artemsen@gmail.com> writes:  
> 
>  > kexec has fully support of ppc64 platform:
>  > https://www.kernel.org/doc/Documentation/kdump/kdump.txt
>  > Added BR2_powerpc64 platform support.  
> 
>  > Signed-off-by: Artem Senichev <artemsen@gmail.com>  
> 
> Committed to 2019.02.x, thanks.

No, you didn't apply this one to 2019.02.x, but the "package/kexec:
enable powerpc64le platforms" one. Notice the subtle difference ? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
