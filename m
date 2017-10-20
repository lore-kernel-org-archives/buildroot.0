From: Henrique Marks <henrique.marks@datacom.ind.br>
Date: Fri, 20 Oct 2017 13:57:48 -0200 (BRST)
Subject: [Buildroot] [PATCH 1/1] boost: bump to 1.65.1
In-Reply-To: <CAFSsvmqLzKA+gDJVK1SdiSEAmHHuqTJfyQC-f05pi_q40QVBqA@mail.gmail.com>
References: <20171017204407.27704-1-Adamduskett@outlook.com>
 <1508352524.9366.4.camel@embedded.rocks>
 <1194870383.14285518.1508429896191.JavaMail.zimbra@datacom.ind.br>
 <CAFSsvmqLzKA+gDJVK1SdiSEAmHHuqTJfyQC-f05pi_q40QVBqA@mail.gmail.com>
Message-ID: <1291751476.14454458.1508515068968.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam

> If you download the latest boost, and check the libs/coroutine2
> folder, there is no longer a src directory.
> Trying to build with "--without-libraries=coroutine2" results in the error:
> "error: wrong library name 'coroutine2' in the --without-<library> option."
> 
> It seems to have been effectively removed!
> 

Thanks for checking this again.

I will have to take a look at this, but this flag "without-libraries" seems strange.

I think it is better to wait for this integration a bit.

Thanks again
-- 
Dr. Henrique Marks
henrique.marks at datacom.ind.br
R. Am?rica, 1000 - Eldorado do Sul - RS
CEP: 92990-000 - Brasil
Fone: +55 51 3933 3000 - Ramal 3466
