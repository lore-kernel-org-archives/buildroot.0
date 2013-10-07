From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Oct 2013 14:07:33 +0200
Subject: [Buildroot] [PATCH] pkg-infra: log current message
In-Reply-To: <30033387.d25L1SpIx8@sagittae>
References: <1381058388-24055-1-git-send-email-yann.morin.1998@free.fr>
 <30033387.d25L1SpIx8@sagittae>
Message-ID: <20131007140733.173904b6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Mon, 07 Oct 2013 12:09:50 +0200, J?r?me Pouiller wrote:

> I have also in my local git some branches modified in a similar fashion. 
> Some weeks ago, Francois Perrad also suggested a patch with a similar 
> modification (http://patchwork.ozlabs.org/patch/265214). Thomas also 
> wrote a patch to get build time statistics   
> (http://lists.busybox.net/pipermail/buildroot/2011-October/046513.html). 
> 
> IMHO, these patchs are too much specific and should not be mainlined. 

I am not sure I agree here. The fact that several of us have such
patches, and that they would indeed be useful to produce build time
statistics, or help the autobuilders provide better diagnostics could
be useful. I believe that it's the real strength of the common package
infrastructure: we can add such additional features on all packages at
once, very easily. Of course, it should be implemented in a nice and
clean way that doesn't complexity too much the core package
infrastructure, but it's very likely easy to achieve with some hooks.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
