From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Feb 2017 23:38:58 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-26: classpath
 issue
In-Reply-To: <20170227142854.34d3fb86@free-electrons.com>
References: <20170227072848.7BD45207F5@mail.free-electrons.com>
 <20170227142854.34d3fb86@free-electrons.com>
Message-ID: <20170227233858.15862daf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Feb 2017 14:28:54 +0100, Thomas Petazzoni wrote:

> >        nios2 |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/279dd731bd9ecf5f9d54bda3715caeaa7cbcdbb3
> > microblazeel |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/55eb89f89e96b94a821778bc18ed844af08b7460  
> 
> Perhaps this needs a commit like
> https://git.buildroot.org/buildroot/commit/?id=f12a146f817c8ef07a7d41a31a5336b5ef6a96e8
> but for nios2 and microblaze ?

For this one, I submitted:

   http://patchwork.ozlabs.org/patch/733183/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
