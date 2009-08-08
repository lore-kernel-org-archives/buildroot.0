From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Sun, 09 Aug 2009 00:36:36 +0200
Subject: [Buildroot] [PATCH] Re: buildroot-libtool.patch failed with
 dbus 1.3.0
In-Reply-To: <20090808200911.4e986c77@surf>
References: <4A7C85F0.7070604@eclis.ch>
	<20090807221717.53039a10@surf>	<4A7C9F65.4060104@eclis.ch>
	<20090808004346.443b9e49@surf>	<4A7CB3CC.8040401@eclis.ch>
	<20090808200911.4e986c77@surf>
Message-ID: <4A7DFDF4.3020103@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni a ?crit :
> Le Sat, 08 Aug 2009 01:07:56 +0200,
> Jean-Christian de Rivaz <jc@eclis.ch> a ?crit :
> 
>> See the patch below. I Hope it's the right way.
> 
> Thanks. The patch was damaged by your e-mail client it seems, but I've
> been able to fix it manually. I've integrated your fix into my
> for-2009.08 branch, that hopefully will get pulled by Peter Korsgaard,
> Buildroot's maintainer, when he'll get back from holidays.
> 
>  http://git.buildroot.net/~tpetazzoni/git/buildroot/log/?h=for-2009.08.

Sorry for the broken patch and tanks for accepting it. I have to learn
the git mail command some day...

> However, while dbus compilation works successfully now, dbus-glib still
> fails to build here:
> 
>  /usr/lib/libgobject-2.0.so: could not read symbols: File in wrong
>  format collect2: ld returned 1 exit status
> 
> So it's a libtool patch issue, again :-)

That's strange since I use dbus-glib on a ARM target for about 20
applications with the dbus-1.3.0 without that problem. I usually get the
wrong format message when I have not do a make clean before switching to
an other architecture. Can you post more lines before the error so I can
compare with my own build ?

Best Regards,

Jean-Christian de Rivaz
