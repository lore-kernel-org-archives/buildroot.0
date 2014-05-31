From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 May 2014 11:37:36 +0200
Subject: [Buildroot] [PATCH 1/1] ti-gfx: pkg-config should also set
 parent include dir
In-Reply-To: <53895BCA.8020900@gmx.net>
References: <1401462022-10744-1-git-send-email-syntheticpp@gmx.net>
 <CAEBucnAiAtrF1uthDyuTPyS5TF8OQdSBchCLZOwRuLJ+ZP67wg@mail.gmail.com>
 <5388A9DC.1010204@gmx.net>
 <CAEBucnDa_EjmUu2buXEA16by0_Wck+sp-RF1Rajc8uSOswb_Zg@mail.gmail.com>
 <20140530222718.5cb42dd5@free-electrons.com>
 <5388ECDC.6050909@gmx.net> <8761kn7zw8.fsf@dell.be.48ers.dk>
 <5388F853.1020406@gmx.net> <87ha476j19.fsf@dell.be.48ers.dk>
 <53895BCA.8020900@gmx.net>
Message-ID: <20140531093736.GA3522@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter?, All,

On 2014-05-31 06:34 +0200, Peter K?mmel spake thusly:
> Anyway, seems Cflags: -I${includedir} is the minimum for all
> GL config files.

I've just checked, and that's what other gelsv2 providers seem to do.
rpi-userland provides a glesv2.pc that contains Cflags: -I${includedir}

So, I'm fine with the conclusion to switch to using that.

Peter K., please put me in Cc: of your next patches on the subject.

Regards, Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
