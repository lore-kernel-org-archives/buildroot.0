From: ilranzani <marco_cantu_ranzani@libero.it>
Date: Mon, 24 Oct 2011 08:40:31 -0700 (PDT)
Subject: [Buildroot] GnuPG
In-Reply-To: <8167afaddbb08fc25202dbf489d78389@zacarias.com.ar>
References: <0D753D10438DA54287A00B02708426976450C42C46@AUSP01VMBX24.collaborationhost.net>
 <32709446.post@talk.nabble.com>
 <8167afaddbb08fc25202dbf489d78389@zacarias.com.ar>
Message-ID: <32711202.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Steps:
+ LIBKSBA
+ LIBASSUAN
=== pth
- gnupg
- gpgme
- opgk

While compiling PTH 2.0.7


./libtool: line 1300: func_opt_split: command not found
libtool: Version mismatch error.  This is libtool 2.2.10, but the
libtool: definition of this LT_INIT comes from an older release.
libtool: You should recreate aclocal.m4 with macros from libtool 2.2.10
libtool: and run autoconf again.
make[1]: *** [pth_uctx.lo] Error 63
make[1]: *** Waiting for unfinished jobs....



Gustavo Zacarias-2 wrote:
> 
> On 24.10.2011 08:12, ilranzani wrote:
> 
>> Nobody?
>>
>> (in buildroot there's already libgcrypt)
>>
>> UP UP UP ! :)
> 
> It's not too hard, you just need to add a couple of extra libraries 
> (packages) that it needs, IIRC libassuan and libksba.
> The rest of the mandatory dependencies are already available 
> (libgpg-error & libgcrypt).
> Regards.
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 

-- 
View this message in context: http://old.nabble.com/GnuPG-tp29967586p32711202.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
