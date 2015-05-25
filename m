From: g4 at novadsp.com <g4@novadsp.com>
Date: Mon, 25 May 2015 20:02:04 +0100
Subject: [Buildroot] BR 2015.02: questions re builds for a B3?
In-Reply-To: <CAGm1_kt5r9W0UeRi+4LWg87kNdtMsDOjF6HrvUOt_VAEca0bfQ@mail.gmail.com>
References: <016301d09701$da9e8e10$8fdbaa30$@novadsp.com>
 <CAGm1_kswdDzE4C1QrxEjHvcfnV2KRe7Weu9J87br7NgF_HdPFQ@mail.gmail.com>
 <018201d0970c$8786bb20$96943160$@novadsp.com>
 <CAGm1_kt550Li788Z4_D1VMq83atzXgabaVvynB8NxhBW4Tj=Sg@mail.gmail.com>
 <01a101d0971a$f66fa480$e34eed80$@novadsp.com>
 <CAGm1_kt5r9W0UeRi+4LWg87kNdtMsDOjF6HrvUOt_VAEca0bfQ@mail.gmail.com>
Message-ID: <01b001d0971d$4a86fa30$df94ee90$@novadsp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor

> Have you read about BR2_EXTERNAL mechanism (the link I've sent you in my
> first mail)? You just need to create your own repo with following
> folders:
> 
> board/mycompany/bbb
> configs
> package
> 
> in board/mycompany/bbb you create following folders like
> 
> board/mycompany/bbb/fs-overlay/etc/network/
> 
> there you place your custom interfaces file.
> 
> You kernel config can be saved in board/mycompany/bbb and you BR
> defconfig goes to configs folder.
> 

OK.  Got that too. 

Have you got an example .config you'd care to post that shows the relevant paths? 
Part of my problem here is knowing/discovering which entries need to be qualified and which do not

Ta x3
