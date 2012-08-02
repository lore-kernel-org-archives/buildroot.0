From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Aug 2012 15:26:40 +0200
Subject: [Buildroot] glibc instead of ulibc ?
In-Reply-To: <1343913806.30162.YahooMailNeo@web164601.mail.gq1.yahoo.com>
References: <1343854870.70701.YahooMailNeo@web164605.mail.gq1.yahoo.com>
 <20120801231635.08b7d808@skate>
 <1343913806.30162.YahooMailNeo@web164601.mail.gq1.yahoo.com>
Message-ID: <20120802152640.5d9cca86@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please keep the Buildroot list in Cc.

Le Thu, 2 Aug 2012 06:23:26 -0700 (PDT),
Zoran Djordjevic <djdjdjole@yahoo.com> a ?crit :

> I am not much familiar with process of linking, but I suppose,
> somwhere (in Lazarus units) is explicitly named glibc.so as file
> which contains necessary binaries (let's say for fclose function). It
> is so in Windows, where I must note (Delphi) dll name and function
> name or index?inside that dll,?in order for linker to find wanted
> function.) Otherwise, I don't know why linker would try to find
> eg.?fclose function exactely?in uclibc.so. Or am I wrong with that
> way of thinking ? 

Yes. The compiler knows which C library it has been linked against, and
automatically links programs against it, unless you explicitly tell it
to do otherwise.

However, I don't know what Lazarus is, and how it works, so maybe it
does funky things. If you want help, please share the current state of
the packages you're trying to add to Buildroot and let us know how to
reproduce the problem, and maybe someone will try to help on this.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
