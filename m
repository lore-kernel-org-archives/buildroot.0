From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 23:02:01 +0100
Subject: [Buildroot] [PATCH v3 1/2] assimp: new package
In-Reply-To: <20151230170547.3f85816c@free-electrons.com>
References: <1450390699-10377-1-git-send-email-ps.report@gmx.net>
 <20151230170547.3f85816c@free-electrons.com>
Message-ID: <20151230230201.6403be7c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Dec 2015 17:05:47 +0100, Thomas Petazzoni wrote:

> This package is causing some build failures:
> 
>   http://autobuild.buildroot.org/?reason=assimp-v3.2
> 
> They all look similar. I guess it's because assimp needs C++11 support.
> Can you have a look ?

One of the issue is different though:

  http://autobuild.buildroot.org/results/79e/79edc3a8c7bcc5a7ffb433bf1ecb645050e2f044/build-end.log

Thanks for your feedback,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
