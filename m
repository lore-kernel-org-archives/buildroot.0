From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 23 May 2008 06:20:18 +0200
Subject: [Buildroot] GTK+ build supported?
References: <C681C76E0D5F1E4BB01DE79E0A80EEC7765A95@usrdes03.ebgroup.elektrobit.com>
Message-ID: <003601c8bc8c$5836aa40$030514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I appreciate your help, John. 
 
> But I must be missing. I don't see a libgtk2 option either. I don't see
> any option with GTK in it.
 
> Sorry if I am just overlooking something obvious. I have re-read the
> menu options probably +20 times and I just don't see it. By now my brain
> is for sure blocking it out if it is there.
 
gtk is a graphic package, and you will find them in a submenu at the bottom.

If that is not the problem, maybe there is a dependency.
You should check the package/libgtk2/Config.in for  
"depend" statement and enable all packages on which libgtk2 depends.
This will be a chain and you have to fix all dpendencies.

Best Regards
Ulf Samuelsson                ulf at atmel.com
