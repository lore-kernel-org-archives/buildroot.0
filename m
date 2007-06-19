From: souf <souf_oued@yahoo.fr>
Date: Tue, 19 Jun 2007 05:51:53 +0200
Subject: [Buildroot] ALSA libs and utils
In-Reply-To: <61c0054e0706181443s539fef41s298ef8690b237476@mail.gmail.com>
References: <61c0054e0706181333n3fd79fekf918318d3ba208b7@mail.gmail.com>
	<1182202554.22765.3.camel@localhost.localdomain>
	<61c0054e0706181443s539fef41s298ef8690b237476@mail.gmail.com>
Message-ID: <1182225113.3228.5.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lundi 18 juin 2007 ? 16:43 -0500, Paul Kavan a ?crit :


> 
> I have never patched buildroot before. Would  I go to the top level
> directory of buildroot and do something like: 
> 
> patch -p1 < [patchname]
> 
> Thanks
> 
> Paul 

personally I always test the patchs before applying them:

patch --dry-run -p1 < [patchname]

If there is not errors, you apply the patch.

patch -p1 < [patchname]

or

cd buildroot
cat ../patchname | patch -p1

Thanks.

Malek
