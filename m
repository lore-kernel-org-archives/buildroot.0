From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Aug 2008 16:07:46 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
In-Reply-To: <20080826134856.GK2213@mx.loc> (Bernhard Reutner-Fischer's
	message of "Tue\, 26 Aug 2008 15\:48\:56 +0200")
References: <20080826121930.77B8B3C79C@busybox.net>
	<87k5e3gbne.fsf@macbook.be.48ers.dk> <20080826134856.GK2213@mx.loc>
Message-ID: <87ej4bdg3x.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 Bernhard> This was recently changed (for the bad, imho).
 Bernhard> Previously, we had a "choice" for either of

 Bernhard>  XSERVER_none
 Bernhard>  XSERVER_xorg7
 Bernhard>  XSERVER_tinyx
 Bernhard>  XSERVER_xggi

The xggi selecton should btw probably go as it doesn't exist.

 Bernhard> With this scheme, you could quickly distinguish if and if yes then which
 Bernhard> xserver was selected:

 Bernhard>   depends on !BR2_XSERVER_none
 Bernhard> to depend on any xserver etc.

 Bernhard> Peter, was it you who changed this xserver choice? What was
 Bernhard> the rationale?

Well, kinda:

r22565:
Author: jacmet <jacmet@69ca8d6d-28ef-0310-b511-8ec308f3f277>
Date:   Mon Jun 30 12:55:29 2008 +0000

    packages: fix xorg to compile modular and tiny versions
    
    Based on googlecode r558 by John Voltz.

I have no problems reverting that hunk. I simply kept it as it was in
googlecode to make it easier to sync later.

-- 
Bye, Peter Korsgaard
