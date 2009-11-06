From: Joachim Pihl <jpihl@nevion.com>
Date: Fri, 6 Nov 2009 14:02:08 +0100
Subject: [Buildroot] Upgrading from Buildroot 0.10 to 2009.08 (ARM)
In-Reply-To: <op.u2y4inl0yqa4qb@jap-lappis.nevion.com>
References: <op.u2yqk2doyqa4qb@jap-lappis.nevion.com>
	<20091106100459.2624b645@surf>
	<op.u2yu62ifyqa4qb@jap-lappis.nevion.com>
	<20091106105325.440f0373@surf>
	<op.u2y208p6yqa4qb@jap-lappis.nevion.com>
	<op.u2y3mgyqyqa4qb@jap-lappis.nevion.com>
	<op.u2y4inl0yqa4qb@jap-lappis.nevion.com>
Message-ID: <op.u2y45uu7yqa4qb@jap-lappis.nevion.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 06 Nov 2009 13:48:13 +0100, Joachim Pihl <jpihl@nevion.com> wrote:

> I keep answering myself...

Yet again...

> Now there is no libpthreads on the target! That would explain a whole  
> lot.
> I have looked through all options in xconfig (I think), is there a key I
> could/should add to the dependencies of boost_threads to make sure it is
> included?

Sorry for the false alarm, looked in the wrong directory. libpthreads is  
of course in /lib, not in /usr/lib.

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
