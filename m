From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Oct 2011 12:56:48 +0200
Subject: [Buildroot] [PATCH 2/4] ocf: new package
In-Reply-To: <e2cbdc0fad426d5b9cab3fe2c085d35e@zacarias.com.ar>
References: <1319132933-13938-1-git-send-email-gustavo@zacarias.com.ar>
 <1319132933-13938-2-git-send-email-gustavo@zacarias.com.ar>
 <20111021085347.6e48f74c@skate>
 <e2cbdc0fad426d5b9cab3fe2c085d35e@zacarias.com.ar>
Message-ID: <20111021125648.107342fd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 21 Oct 2011 07:33:12 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> Fair enough, though it won't break anything if it's enabled and you 
> lack OCF support on the kernel side.
> Similar to what would happen if you don't load the appropiate modules 
> or lack hardware support.

Yeah, it's not a hard dependency, just a documentation comment on how
to take advantage of it.

> > So basically, it's just a header that needs to be installed?
> >
> > Thomas
> 
> Yes.
> For the moment we've got OpenSSL and maybe Openswan that uses OCF.
> Of course anything that links to OpenSSL uses OCF when it's properly 
> enabled on supporting hardware.

Ok, thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
