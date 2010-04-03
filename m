From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 03 Apr 2010 15:32:42 +0200
Subject: [Buildroot] shared libraries with debug symbols
In-Reply-To: <4BB62EE1.7050409@browserseal.com>
References: <4BB62EE1.7050409@browserseal.com>
Message-ID: <1270301562.31425.9.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le vendredi 02 avril 2010 ? 20:52 +0300, Sasha Sirotkin a ?crit :
> It looks like " build packages with debugging symbols" does not affect 
> shared libraries - even though that when it is enabled all binaries are 
> copied with debug symbols shared libraries are not. Is this a bug? Any 
> idea how to "fix" this?
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

It works here. I have a the webkit/gtk library compiled with debug
symbols. It's around 270Mb...

Please give more informations (like your buildroot config file). Also,
did you activated the "build packages with debugging symbols" after
having build everything ?

-- 
Lionel Landwerlin
