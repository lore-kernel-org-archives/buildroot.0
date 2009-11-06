From: Joachim Pihl <jpihl@nevion.com>
Date: Fri, 6 Nov 2009 10:26:52 +0100
Subject: [Buildroot] Upgrading from Buildroot 0.10 to 2009.08 (ARM)
In-Reply-To: <20091106100459.2624b645@surf>
References: <op.u2yqk2doyqa4qb@jap-lappis.nevion.com>
	<20091106100459.2624b645@surf>
Message-ID: <op.u2yu62ifyqa4qb@jap-lappis.nevion.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 06 Nov 2009 10:04:59 +0100, Thomas Petazzoni  
<thomas.petazzoni@free-electrons.com> wrote:

> Please send your .config to the list and describe what are the
> dependencies of your own applications.

All the crashing applications are built _outside_ the buildroot  
environment, using the toolchain created by buildroot. This worked  
perfectly before I started messing with it.

We have added 5 packages to buildroot, none of these have configurational  
dependencies outside themselves. The packages are:

libgd
boost
spread
libsnmppdu
libnetwork


-- 
Joachim Pihl
Senior R&D Engineer
Nevion

Tel: +47 33 48 94 66
Fax: +47 33 48 99 98
Mobile: +47 91 33 98 91
jpihl at nevion.com
www.nevion.com

-----------------------------------
The Global Video Transport Leader
-----------------------------------
