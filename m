From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 18 Sep 2007 08:35:50 +0200
Subject: [Buildroot] unable to build fontconfig
In-Reply-To: <2D30722FBBDE6749973243F4F01BE984C6568F@dotexchange.dotcorporation.com>
References: <2D30722FBBDE6749973243F4F01BE984C6568F@dotexchange.dotcorporation.com>
Message-ID: <1190097350.4064.1.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2007-09-17 klockan 16:55 -0700 skrev Kay McCormick:
> I can?t disable fontconfig, but it won?t build either!
> 
>  
> 
You cannot disable FONTCONFIG because something
has "selected" this package.
If you, in menuconfig, look at the help item
for fontconfig, it will tell you what forces
fontconfig to be built.
Possibly there is a chain of dependencies.

BR
Ulf Samuelsson

>  
> 
> Help!
> 
>  
> 
> Kay
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
