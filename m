From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Oct 2016 11:05:26 +0200
Subject: [Buildroot] Report from the Buildroot Meeting in Berlin
In-Reply-To: <51578cf5-58ba-38ce-6fee-6535784bd150@mind.be>
References: <20161019221035.2350c181@free-electrons.com>
 <c2da1832-3282-33f0-1588-e828f3df4801@mind.be>
 <20161021102556.10d9a5e6@free-electrons.com>
 <51578cf5-58ba-38ce-6fee-6535784bd150@mind.be>
Message-ID: <20161021110526.7829792f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Oct 2016 10:57:28 +0200, Arnout Vandecappelle wrote:

> > That being said, what matters to me is that we improve the code to make
> > it clear which flags go in the wrapper and which flags do not. Having a
> > TARGET_WRAPPER_CFLAGS separate from TARGET_EXTRA_CFLAGS will make this
> > very clear, which TARGET_CFLAGS being set to $(TARGET_WRAPPER_CFLAGS)
> > $(TARGET_EXTRA_CFLAGS).  
> 
>  +1 to the naming. Although I think I'll call it TARGET_FLAGS because we will
> use them for LDFLAGS and CXXFLAGS and FCFLAGS as well.

Yes, absolutely. I had forgotten about that, but I continue to agree
with TARGET_FLAGS, which is then used to set all of CFLAGS, CXXFLAGS,
LDFLAGS and FCFLAGS.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
