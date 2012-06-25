From: Aleksandar Zivkovic <Aleksandar.Zivkovic@rt-rk.com>
Date: Mon, 25 Jun 2012 16:16:29 +0200
Subject: [Buildroot] Can I use the toolchain build with buildroot,
 as an external toolchain ?
In-Reply-To: <20120623104553.6a1cd9d6@skate>
References: <1531E53627F1F749B4FE809BF2A4EB6703136FE8@WETMEX10.loepfe.com>
 <jkfl6r$bev$1@dough.gmane.org> <20120322175530.1f14a73a@skate>
 <4F6B677E.4020706@gmail.com> <js1vea$ns$1@dough.gmane.org>
 <20120623104553.6a1cd9d6@skate>
Message-ID: <js9rrs$seg$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/06/2012 10:45, Thomas Petazzoni wrote:
> Le Fri, 22 Jun 2012 16:28:28 +0200,
> Aleksandar Zivkovic<Aleksandar.Zivkovic@rt-rk.com>  a ?crit :
>
>> Too many arguments
>
> You're using Buildroot 2011.05, and the problem you're facing is a
> limitation in the external toolchain wrapper, which has been fixed
> since then.
>
> For reference, this problem has been fixed by
> e8c46b118b011c766511c44fa9232e074ad6bcbc. So either you need to upgrade
> your Buildroot version, or you need to backport this patch in 2011.05
> (which should be relatively easy since this change has been made no
> long after the 2011.05 release).
>
> Best regards,
>
>
> Thomas

Dear Thomas,

thank you for quick and precise answer! I have applied improvements done 
at my Buildroot 2011.05 and now am able to enjoy in 50 minutes faster 
build after toolchain is built once.

Regards,
Aleksandar
