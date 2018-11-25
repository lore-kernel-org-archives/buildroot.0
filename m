From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Nov 2018 10:45:53 +0100
Subject: [Buildroot] [PATCH] docs/manual: standardize a bit more the
 formatting of commit titles
In-Reply-To: <1442786873.3545705.1543108593942.JavaMail.zimbra@datacom.com.br>
References: <20181124101903.18138-1-thomas.petazzoni@bootlin.com>
 <1442786873.3545705.1543108593942.JavaMail.zimbra@datacom.com.br>
Message-ID: <20181125104553.3f24be17@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Nov 2018 23:16:33 -0200 (BRST), Carlos Santos wrote:

> Looks good, but isn't "package/" a bit superfluous, since Most of the
> commits are for packages? It also goes against the tradition:
> 
> $ git log --oneline origin/master | grep -i '^.......... [^ /]*: bump' |wc -l
> 7644
> $ git log --oneline origin/master | grep -i '^.......... [^ ]*/[^ ]*: bump' |wc -l
> 2296

Yes, I agree the tradition has been without package/. I myself used to
prefer without package/. However, it is not very consistent, as then
when we have boot/uboot, is it about package/boot/uboot ? Or when we
have core: <something>, is it about the package "core" ?

While I was personally not adding package/, I saw others doing it, and
ultimately found it more consistent.

> BTW, I want the bike shed red.

Red is not too bad :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
