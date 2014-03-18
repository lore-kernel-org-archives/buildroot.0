From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 18 Mar 2014 13:00:37 +0100
Subject: [Buildroot] Patchwork cleanup #7: triaging proposal
In-Reply-To: <20140316160712.GA3267@free.fr>
References: <CAAXf6LWP0FX4AAGP_ACZHgoxEAEwarpEdHchukxE+V=WJnXROg@mail.gmail.com>
 <20140316160712.GA3267@free.fr>
Message-ID: <3293654.U6daepvtBH@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 16 March 2014 17:07:12 Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2014-03-16 08:48 +0100, Thomas De Schampheleire spake thusly:
[...]
> > [v2] Standardisation of $(BUILD)/.root name
> > http://patchwork.ozlabs.org/patch/265680/
> 
>     Vote C: unsure.
I am also unsure:
  - With integration of parallel make, i think this patch does no more apply 
correctly to master.

  - It looks like stamps/ directory is no more used. So, it may be possible to 
drop stamps/. I continue to think .root should be more visible, but I am not 
sure about where to place it.


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
