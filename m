From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 10:02:16 +0200
Subject: [Buildroot] [PATCH 4/4] package/selinux-python: always build
 sepolgen
In-Reply-To: <7a945931-ca28-45c1-17ba-6a50f5a192d7@mind.be>
References: <20191009220641.24605-1-arnout@mind.be>
 <20191009220641.24605-4-arnout@mind.be>
 <20191010092619.2c0a6f0b@windsurf>
 <7a945931-ca28-45c1-17ba-6a50f5a192d7@mind.be>
Message-ID: <20191010100216.5ac2606c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 10 Oct 2019 09:56:52 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > As you can see, there's much more than audit2allow and sepolgen in this
> > package, even though those additional things are not installed today.  
> 
>  On the other hand, the way it is now is a bit stupid too...
> 
>  If we ever add these other options, we could still revert this patch. But
> nobody felt the need to add them in the 5 years that selinux exists in Buildroot...

I discovered how this selinux-python package was organized 2 weeks ago,
while packaging it for OpenWRT. And just like what I did with this 30
patches patch series, which comes from the work I did packaging SELinux
for OpenWRT, it was also on my TODO-list to improve selinux-python in
Buildroot. But as you can imagine, this TODO-list is also filled up
with plenty of other things, so I don't know when I'll get to it.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
