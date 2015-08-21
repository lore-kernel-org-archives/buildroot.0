From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Aug 2015 00:17:54 +0200
Subject: [Buildroot] [PATCH v1 0/2] Checking whether a certain CONFIG_*
	is set
In-Reply-To: <20150821210519.GB3753@free.fr> (Yann E. MORIN's message of "Fri, 
 21 Aug 2015 23:05:19 +0200")
References: <87lhd98twt.fsf@dell.be.48ers.dk>
 <1439990076-10412-1-git-send-email-viktorin@rehivetech.com>
 <20150819194643.1fad6062@free-electrons.com>
 <20150819190534.GA13372@free.fr> <87r3mz6lba.fsf@dell.be.48ers.dk>
 <20150821132227.GA3753@free.fr> <877foo75em.fsf@dell.be.48ers.dk>
 <20150821210519.GB3753@free.fr>
Message-ID: <8737zc70bx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

>> >> Why not just like the kernel-module infrastructure handle it like I
 >> >> proposed? I don't think it is very nice that people have to remember to
 >> >> add the select as well (and chances are they won't notice if they
 >> >> forget).
 >> 
 >> > Because that would not work for packages in br2-external trees, as I
 >> > already explained.
 >> 
 >> Are you sure? I didn't try it, but as we only *USE* the variable when
 >> LINUX_KCONFIG_FIXUP_CMDS runs, which is after all the .mk files have
 >> been parsed I think it should work?

 > Ah, just checking would indeed be doable, something similar (but more
 > restrictive) to the patch proposed by Jan:
 >     https://patchwork.ozlabs.org/patch/508729/

We seemed to be talking past eachother, but got it sorted out on
IRC. For others following, the change I suggested was actually the one
mentioned here:

http://lists.busybox.net/pipermail/buildroot/2015-August/137540.html

-- 
Venlig hilsen,
Peter Korsgaard 
