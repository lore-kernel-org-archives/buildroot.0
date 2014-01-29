From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jan 2014 09:26:16 +0100
Subject: [Buildroot] command line regular expression substitution fails
In-Reply-To: <52E8A467.5070703@mind.be>
References: <52CC7292.306@alcatel-lucent.com>
 <CAOkaJuVFmrrfda=vG-+06vJp7_jJvhnCAzJy8RJKZ8BxE6XKWA@mail.gmail.com>
 <52CD5340.2090200@alcatel-lucent.com>
 <CAOkaJuVGa4_Et8TL80MEsh8sN1mseKvQ4OZ9RzxSouytbZFUFQ@mail.gmail.com>
 <52CF0287.8010505@alcatel-lucent.com>
 <20140128221002.157e8b71@skate> <52E8A467.5070703@mind.be>
Message-ID: <20140129092616.7207a8e9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 29 Jan 2014 07:49:11 +0100, Arnout Vandecappelle wrote:

> > No, A8 and A9 are not the same from a floating point perspective.
> >
> > As visible in
> > http://git.buildroot.net/buildroot/tree/arch/Config.in.arm#n91, NEON
> > and VFPv3 is mandatory on Cortex-A8, but optional on Cortex-A9.
> 
>   Yeah, but in that sense, Cortex-A9 is a subset or Cortex-A8 so if the 
> A8 code works, the A9 code should work as well - which is exactly the 
> reverse of what Ed saw.

Right. I must say I haven't followed all what Ed reported, I merely
replied on the question about A8/A9 floating point equivalence.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
