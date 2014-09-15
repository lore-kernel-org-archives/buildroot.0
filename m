From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Sep 2014 23:16:50 +0200
Subject: [Buildroot] [PATCH 2/4] arch: remove BR2_arm10t
In-Reply-To: <20140915211355.GB3878@free.fr>
References: <1410814919-11523-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1410814919-11523-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140915211355.GB3878@free.fr>
Message-ID: <20140915231650.5b05c0ab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 15 Sep 2014 23:13:55 +0200, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2014-09-15 23:01 +0200, Thomas Petazzoni spake thusly:
> > The BR2_arm10t option is not correct as it references an ARM family,
> > while other options indicate a specific ARM core. The ARM cores in
> > ARM10 family are ARM1020E, ARM1022E and ARM1026EJ-S according to
> > Wikipedia. However, those are clearly very rare, and Wikipedia also
> > indicates two Conexant ADSL-related SoC as being part of this family
> > of ARM cores. Therefore, this commit removes this ARM family.
> 
> You forgot the reference to BR2_arm10t we have in nettle.mk

Gah, indeed, will fix and resend.

Also, in the commit log: s/Wikipedia also/Wikipedia only/.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
