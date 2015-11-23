From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 23 Nov 2015 10:50:23 +0000
Subject: [Buildroot] Which package contains modprobe in buildroot
In-Reply-To: <1586609756.10722764.1448275592553.JavaMail.zimbra@datacom.ind.br>
References: <1586609756.10722764.1448275592553.JavaMail.zimbra@datacom.ind.br>
Message-ID: <5652EF6F.6070504@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Henrique Marks,

On 23/11/15 10:46, DATACOM - henrique.marks wrote:
> Hello
> 
> I am trying to remove busybox from some platform build, and i am
> struggling with modprobe. Which package contains modprobe inside
> buildroot, if i don't want to use busybox ?

the kmod package.

Regards,

Vincent.

> 
> The other packages i could find the equivalents, and in some cases small
> changes were necessary (like not using pidof anymore).
> 
> Thanks in advance
> 
> -- 
> Dr. Henrique Marks
> henrique.marks at datacom.ind.br
> R. Am?rica, 1000 - Eldorado do Sul - RS
> CEP: 92990-000 - Brasil
> Fone: +55 51 3933 3000 - Ramal 3466
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
