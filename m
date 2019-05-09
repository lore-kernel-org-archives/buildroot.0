From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 May 2019 09:46:08 +0200
Subject: [Buildroot] [PATCH] CHANGES: fix missing "binutils" in
 2019.05-rc1 description
In-Reply-To: <875zqkhymm.fsf@dell.be.48ers.dk>
References: <20190509065155.21279-1-thomas.petazzoni@bootlin.com>
 <875zqkhymm.fsf@dell.be.48ers.dk>
Message-ID: <20190509094608.4790f2bc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 09 May 2019 09:32:01 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

>  >  	Toolchain: Glibc bumped to 2.29, musl bumped to 1.1.22,
>  > -	binutils 2.32 added, 2.28/2.29 removed, default changed to
>  > -	2.31.1.
>  > +	binutils 2.32 added, binutils 2.28/2.29 removed, default
>  > +	changed to 2.31.1.  
> 
> I actually did this on purpose as the entire line is about binutils, so
> it is implied for the removed / default part.

Ah yes, indeed, my bad. I read it incorrectly. We can withdraw my patch.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
