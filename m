From: Daniele Salvatore Albano <d.albano@gmail.com>
Date: Sat, 1 Aug 2009 20:50:15 +0200
Subject: [Buildroot] [Bug 523] pciutiles can't find libz
In-Reply-To: <20090801182219.GA14135@mx.loc>
References: <bug-523-163@https.bugs.busybox.net/>
	<20090801174255.46F1B777DF@busybox.osuosl.org>
	<20090801182219.GA14135@mx.loc>
Message-ID: <159a01660908011150n760e2c47l3d38a1adc837dd4b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using files from that repository doesn't fix the problem

I don't know if this depends from my external toolchain, because
removing pciutiles from package list let buildroot to do the job,
hovewer i'll try internal toolchain to see if it works

2009/8/1 Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>:
> On Sat, Aug 01, 2009 at 05:42:55PM +0000, bugzilla at busybox.net wrote:
>>https://bugs.busybox.net/show_bug.cgi?id=523
>
> Oh, and someone might want to pull pciutils from
> http://repo.or.cz/w/buildroot.git?a=tree;f=package/pciutils;hb=HEAD
>
> that one works for me and likely fixes that bug magically
>
> HTH,
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
Daniele Salvatore Albano
Consulente Informatico
http://www.phpsoft.it
http://www.dacci.it

Servizi:
- Sviluppo in C# e PHP
- Installazione e Amministrazione sistemi Ubuntu, CentOS e Fedora
