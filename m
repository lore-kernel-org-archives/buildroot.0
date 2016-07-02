From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 2 Jul 2016 20:54:45 +0200
Subject: [Buildroot] [PATCH 1/2] package/boost: boost-local needs NTPL
 threads
In-Reply-To: <0c77d26a-d98c-372b-fbd0-2e3fb6422183@smile.fr>
References: <1467469950-11984-1-git-send-email-romain.naour@smile.fr>
 <ng0l4dx0de.ln2@ID-313208.user.individual.net>
 <0c77d26a-d98c-372b-fbd0-2e3fb6422183@smile.fr>
Message-ID: <20160702185445.GG17620@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Romain Naour wrote,

> Hi Bernd,
> 
> Le 02/07/2016 ? 16:43, Bernd Kuhls a ?crit :
> > Hi Romain,
> > 
> > Am Sat, 02 Jul 2016 16:32:29 +0200 schrieb Romain Naour:
> > 
> >> Since Boost 1.61.0 boost-local require a toolchain with NTPL threads
> >> support.
> > 
> > NAK, the Cortex m4 toolchain is broken, not boost:
> > http://lists.busybox.net/pipermail/buildroot/2016-June/163865.html
> 
> Thanks for the link.
> I guess the patch 2/2 has the same issue on NTPL requirement.
> Still we probably need the library handling in the packaging.
> 
> Is the patch from Waldemar has been merged upstream ?
> For now, can we add an autobuilder exception ?

I have sent a official patch today to buildroot and reported the
issue upstream.

best regards
 Waldemar
