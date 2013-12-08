From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Dec 2013 21:52:05 +0100
Subject: [Buildroot] [PATCH] php: bump to version 5.5.6
In-Reply-To: <52A4C794.7070301@zacarias.com.ar>
References: <1386528934-28676-1-git-send-email-gustavo@zacarias.com.ar>
 <20131208201249.2f3e89a5@skate> <52A4C794.7070301@zacarias.com.ar>
Message-ID: <20131208215205.19b1750c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 08 Dec 2013 16:25:08 -0300, Gustavo Zacarias wrote:

> That's a language extension/construct that's been thrown out.
> Unfortunately there are other builtins that aren't options that suffer
> the same fate, so anyone migrating code from an older php series will
> have to check/adapt their code as usual, i don't see much point in just
> warning the user for a rarely used extension.
> I think it'll just give the impression that everything else is the same
> and it's not.
> They'll have to read http://www.php.net/migration55 and
> http://www.php.net/migration54 and check their code anyway (where it's
> already mentioned).

Ok, true, I understand the idea.


> > New comment ?
> 
> True, i'll fix it in v2.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
