From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 17:05:47 +0100
Subject: [Buildroot] [PATCH v3 1/2] assimp: new package
In-Reply-To: <1450390699-10377-1-git-send-email-ps.report@gmx.net>
References: <1450390699-10377-1-git-send-email-ps.report@gmx.net>
Message-ID: <20151230170547.3f85816c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Thu, 17 Dec 2015 23:18:18 +0100, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ----
> Changes v1 -> v2:
>   - use github helper (thanks to J?rg Krause)

This package is causing some build failures:

  http://autobuild.buildroot.org/?reason=assimp-v3.2

They all look similar. I guess it's because assimp needs C++11 support.
Can you have a look ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
