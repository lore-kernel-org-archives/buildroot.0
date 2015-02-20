From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Feb 2015 19:35:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_xfs: Fix linking
 error
In-Reply-To: <1424452969-6166-1-git-send-email-bernd.kuhls@t-online.de>
References: <1424452969-6166-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150220193524.72d2ff63@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 20 Feb 2015 18:22:49 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/a0b/a0bd6312d450fb78db7f57d3db9e01ba2b26687d//
> http://autobuild.buildroot.net/results/534/5347293cdcd7eb2e84b762ee9d073f3b937b5312//
> http://autobuild.buildroot.net/results/b5e/b5e7599ba33dc43a8f7e81bfa6d7ad9cb0ac68a1//
> 
> and many others (microblazeel only)

Maybe this is a silly question, but do we know why this error is
appearing on Microblaze only?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
