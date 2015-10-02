From: Vincent Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 2 Oct 2015 17:34:28 +0000
Subject: [Buildroot] [PATCH] mutt: bump to version 1.5.24
In-Reply-To: <560EBD8D.3090205@zacarias.com.ar>
References: <1443805873-24176-1-git-send-email-gustavo@zacarias.com.ar>
 <38121FAB319C3344930C920E7B5183136A3DBDD1@LEMAIL01.le.imgtec.org>,
 <560EBD8D.3090205@zacarias.com.ar>
Message-ID: <38121FAB319C3344930C920E7B5183136A3DBE8E@LEMAIL01.le.imgtec.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

ok, understood.

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ file output/target/usr/bin/mutt
output/target/usr/bin/mutt: ELF 32-bit MSB executable, MIPS, MIPS32 rel2 version 1 (SYSV), dynamically linked, interpreter /lib/ld.so.1, for GNU/Linux 2.6.32, stripped

$ grep ^MUTT_VERSION package/mutt/mutt.mk 
MUTT_VERSION = 1.5.24

Regards,

Vincent.


________________________________________
From: Gustavo Zacarias [gustavo at zacarias.com.ar]
Sent: 02 October 2015 18:23
To: Vincent Olivert Riera
Cc: buildroot at buildroot.org
Subject: Re: [Buildroot] [PATCH] mutt: bump to version 1.5.24

On 02/10/15 14:21, Vincent Olivert Riera wrote:

> Dear Gustavo Zacarias,
>
> Is there a problem with downloading from an ftp? I think is better to download the sources from the official site.
>
> Regards,
>
> Vincent.

Hi.
Corporate firewalls tend to block ftp more than https.
Bitbucket is listed in the mutt homepage, ftp is listed as primary, but
it's just as official (yeah, bad wording).
Regards.
