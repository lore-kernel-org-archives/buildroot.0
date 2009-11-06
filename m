From: Joachim Pihl <jpihl@nevion.com>
Date: Fri, 6 Nov 2009 13:28:54 +0100
Subject: [Buildroot] Upgrading from Buildroot 0.10 to 2009.08 (ARM)
In-Reply-To: <op.u2y208p6yqa4qb@jap-lappis.nevion.com>
References: <op.u2yqk2doyqa4qb@jap-lappis.nevion.com>
	<20091106100459.2624b645@surf>
	<op.u2yu62ifyqa4qb@jap-lappis.nevion.com>
	<20091106105325.440f0373@surf>
	<op.u2y208p6yqa4qb@jap-lappis.nevion.com>
Message-ID: <op.u2y3mgyqyqa4qb@jap-lappis.nevion.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 06 Nov 2009 13:16:10 +0100, Joachim Pihl <jpihl@nevion.com> wrote:

> Doesn't look good to me, will revert to previous tool chain to have a  
> look
> at what it says then. In the old buildroot, we had the threads library  
> set
> to linuxthreads, but I have changed that to NPTL. Could that be the
> culprit?

I have narrowed the field a bit. It turns out that applications built and  
linked with gcc work, those built with g++ DO NOT. Must be some library  
issue of sorts.

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
