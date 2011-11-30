From: Jeff Krasky <jeff.krasky@dspcg.com>
Date: Wed, 30 Nov 2011 14:01:10 -0600
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <CAAXf6LWSPgAR6C_+eqq5DZ5CCJkzJ22zpfyTzr7bNEGj-mOKYw@mail.gmail.com>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98><201111281139.37028.minimod@morethan.org><002701ccadfe$961b9430$0400a8c0@dspcgrnzks9p98><201111281324.38619.minimod@morethan.org><003601ccae04$ada02e80$0400a8c0@dspcgrnzks9p98><003801ccae12$a7781190$0400a8c0@dspcgrnzks9p98><003901ccae1b$2d82f950$0400a8c0@dspcgrnzks9p98><20111129083710.1a83fad6@skate><001201ccaea3$3ad7df70$0400a8c0@dspcgrnzks9p98><20111129153619.4f080721@skate><001301ccaea5$37ec1f40$0400a8c0@dspcgrnzks9p98><001401ccaedf$e5751f60$0400a8c0@dspcgrnzks9p98><001501ccaee8$34c408d0$0400a8c0@dspcgrnzks9p98><000b01ccaf79$085d0800$0400a8c0@dspcgrnzks9p98><20111130170450.2f33e6c2@skate><000c01ccaf7c$01f3c460$0400a8c0@dspcgrnzks9p98><20111130173327.069f46fb@skate><000d01ccaf7e$78243280$0400a8c0@dspcgrnzks9p98><CAAXf6LV8ArEeuQ=w3r7745AK00t2XqtSoLqv+tBc9rnpjS8sCQ@mail.gmail.com><000f01ccaf8b$7279ed90$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LWSPgAR6C_+eqq5DZ5CCJkzJ22zpfyTzr7bNEGj-mOKYw@mail.gmail.com>
Message-ID: <001101ccaf9a$cebe63b0$0400a8c0@dspcgrnzks9p98>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> You do realize that these rules are purely intended for the module, right.

No, I thought it would do both.  I have a second build running with both
$evals in it.  Hopefully that will do it.

> Based on what ThomasP says, things may be a little more complicated
> than I originally thought.

Do I need to separate sets of build rules in the .mk?

> Just checking: you are looking into output/target/lib/modules or
> /lib/modules on the target right, not /lib/modules on the host?

Correct, I am looking at /lib/modules when running the Linux image on the
target.

> If the modules_install step in your .mk file goes well, this should
> put the file there.

It did.  I just wrote a post about how it's there but the application isn't.

Thanks again.
