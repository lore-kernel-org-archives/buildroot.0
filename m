From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 29 Nov 2007 23:27:56 +0100
Subject: [Buildroot] Adding new software so it appears in menuconfig
In-Reply-To: <20071129195432.M20637@shakabuku.org>
References: <20071129195432.M20637@shakabuku.org>
Message-ID: <1196375276.13652.159.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor 2007-11-29 klockan 13:56 -0600 skrev Jason Bodnar:
> I've followed the documentation online for adding new software packages to
> buildroot <http://buildroot.uclibc.org/buildroot.html#add_software>, but there
> is no information about how to make the new package appear in the package
> selection menu when running make menuconfig. How do I do that?
> 

Once you have created 

"package/<myapp>/Config.in"
"package/<myapp>/<myapp>.mk"

You have to edit "package/Config.in" to include 
the new package.


> --
> Jason Bodnar
> jason at shakabuku.org
> http://www.shakabuku.org
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
-- 
Best Regards
Ulf Samuelsson
