From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Dec 2011 09:11:52 +0100
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <001301ccafb3$1631f000$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <003901ccae1b$2d82f950$0400a8c0@dspcgrnzks9p98>
 <20111129083710.1a83fad6@skate>
 <001201ccaea3$3ad7df70$0400a8c0@dspcgrnzks9p98>
 <20111129153619.4f080721@skate>
 <001301ccaea5$37ec1f40$0400a8c0@dspcgrnzks9p98>
 <001401ccaedf$e5751f60$0400a8c0@dspcgrnzks9p98>
 <001501ccaee8$34c408d0$0400a8c0@dspcgrnzks9p98>
 <000b01ccaf79$085d0800$0400a8c0@dspcgrnzks9p98>
 <20111130170450.2f33e6c2@skate>
 <000c01ccaf7c$01f3c460$0400a8c0@dspcgrnzks9p98>
 <20111130173327.069f46fb@skate>
 <000d01ccaf7e$78243280$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LV8ArEeuQ=w3r7745AK00t2XqtSoLqv+tBc9rnpjS8sCQ@mail.gmail.com>
 <000f01ccaf8b$7279ed90$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LWSPgAR6C_+eqq5DZ5CCJkzJ22zpfyTzr7bNEGj-mOKYw@mail.gmail.com>
 <001101ccaf9a$cebe63b0$0400a8c0@dspcgrnzks9p98>
 <20111130232114.208390c8@skate>
 <001201ccafb0$4b5e06e0$0400a8c0@dspcgrnzks9p98>
 <20111130234906.4f75994e@skate>
 <001301ccafb3$1631f000$0400a8c0@dspcgrnzks9p98>
Message-ID: <20111201091152.68aa9433@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 30 Nov 2011 16:54:58 -0600,
"Jeff Krasky" <jeff.krasky@dspcg.com> a ?crit :

> Oh, ok.  So the patch will be a .patch file on 
> 
> http://buildroot.uclibc.org/downloads/

No, the patch is in an e-mail I have sent to the list yesterday evening.

> 1. download it
> 2. go into buildroot-2011.11 directory
> 3. run 'patch filename.patch'

No:

cat filename.patch | patch -p1

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
