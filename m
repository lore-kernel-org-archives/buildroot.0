From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Oct 2013 17:41:02 +0200
Subject: [Buildroot] buildroot requires a password
In-Reply-To: <DE9772AAEF4F4E35B1CA8F3B5A7C7865@M58p>
References: <0F793FF065914549A7D55A219164CACB@M58p>
 <20131012145021.02d468e4@skate>
 <72BD24884B4745F4BE4A855D78178642@M58p>
 <20131012165639.0bc4a78d@skate>
 <DE9772AAEF4F4E35B1CA8F3B5A7C7865@M58p>
Message-ID: <20131012174102.26bfa3b2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sabri Altunbas,

I believe I asked you to keep the Buildroot list in Cc. Please do it.

On Sat, 12 Oct 2013 17:35:15 +0200, Sabri Altunbas wrote:

> Perfectly, i deactivated BR2_PREFER_STATIC_LIB and perform "make clean and
> make all" only "make all" doesn't work (why not ?)

See http://buildroot.org/downloads/manual/manual.html#full-rebuild.

> But I think (as you). It must be safely that a faulty operation can not
> happen.

I agree. As I said, I'll send a patch to make sure this situation
cannot happen.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
