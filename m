From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jun 2016 21:16:00 +0200
Subject: [Buildroot] [PATCH 001/121] package/at91bootstrap: add hash file
In-Reply-To: <5375395bb8adb2ba08b148d702afb01c1f41f553.1466334225.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 19 Jun 2016 13:08:48 +0200")
References: <cover.1466334225.git.yann.morin.1998@free.fr>
 <5375395bb8adb2ba08b148d702afb01c1f41f553.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <87h9cp3s7j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 >  boot/at91bootstrap/at91bootstrap.hash | 2 ++
 >  1 file changed, 2 insertions(+)
 >  create mode 100644 boot/at91bootstrap/at91bootstrap.hash

 > diff --git a/boot/at91bootstrap/at91bootstrap.hash b/boot/at91bootstrap/at91bootstrap.hash
 > new file mode 100644
 > index 0000000..0c4ef5f
 > --- /dev/null
 > +++ b/boot/at91bootstrap/at91bootstrap.hash
 > @@ -0,0 +1,2 @@
 > +# localy computed

(here and elsewhere) s/localy/locally/ :P

> +sha256  d66192a274247f4baa39fa932eadf903d7add55641d89d30402f967c4f2282a5  AT91Bootstrap1.16.zip
 > -- 
 > 2.7.4

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
