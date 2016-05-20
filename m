From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 May 2016 16:29:29 +0200
Subject: [Buildroot] [RFC/PATCH next 2/2] couchdb: New package.
In-Reply-To: <573F1EAD.8040706@green-communications.fr>
References: <1463673580-10676-1-git-send-email-nicolas.cavallari@green-communications.fr>
 <1463673580-10676-2-git-send-email-nicolas.cavallari@green-communications.fr>
 <b4651105-f652-0bd1-b5ef-4cf0be436522@mind.be>
 <20160520145341.156fab90@free-electrons.com>
 <573F1EAD.8040706@green-communications.fr>
Message-ID: <20160520162929.04ca1b1b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 May 2016 16:26:53 +0200, Nicolas Cavallari wrote:

> >>  My first reaction was: can't we use a more recent version from git instead of
> >> an almost-two-years-old release, but that won't be easy because of all the
> >> submodules.  
> > 
> > Does the latest git versions also need spidermonkey 1.8.5 ?  
> 
> Yes, Unfortunately...

Yerk.

> > If not, then I think I'd prefer to add support to fetch submodules (we
> > already have patches doing this, from Yann, and they are reasonable),
> > and skip the addition of this unmaintained spidermonkey thing.  
> 
> These are not git submodules, they are submodules as in "./configure
> git-clone them". Plus there are even more hardcoded /usr/include paths
> in their build system. It seems wiser to wait for a tarball.

and yerk.

Do we want to package couchdb ? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
