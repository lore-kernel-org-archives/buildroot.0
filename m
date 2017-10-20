From: Henrique Marks <henrique.marks@datacom.ind.br>
Date: Fri, 20 Oct 2017 15:15:39 -0200 (BRST)
Subject: [Buildroot] [PATCH 1/1] boost: bump to 1.65.1
In-Reply-To: <igkpbexvci.ln2@ID-313208.user.individual.net>
References: <20171017204407.27704-1-Adamduskett@outlook.com>
 <1508352524.9366.4.camel@embedded.rocks>
 <1194870383.14285518.1508429896191.JavaMail.zimbra@datacom.ind.br>
 <CAFSsvmqLzKA+gDJVK1SdiSEAmHHuqTJfyQC-f05pi_q40QVBqA@mail.gmail.com>
 <igkpbexvci.ln2@ID-313208.user.individual.net>
Message-ID: <1238032811.14479233.1508519739242.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> Hi,
> 
> yes, it was removed as a binary lib and converted into a header-only lib:
> https://github.com/boostorg/coroutine2/commit/5b06384117d19b8ce8b52678fe7f62d9f1354155
> 
> Regards, Bernd
> 

I have tested it and the module that depends on coroutine2 works in boost 1.65.1, exactly because of this.

But coroutine2 is there, as the release notes states.

Thanks

-- 
Dr. Henrique Marks
henrique.marks at datacom.ind.br
R. Am?rica, 1000 - Eldorado do Sul - RS
CEP: 92990-000 - Brasil
Fone: +55 51 3933 3000 - Ramal 3466
