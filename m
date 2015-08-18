From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 10:33:34 +0200
Subject: [Buildroot] [PATCHv2] [autobuild] package/bwm-ng: fix build
 failures with gcc-5
In-Reply-To: <20150817210425.GB3988@free.fr>
References: <1439736791-28748-1-git-send-email-yann.morin.1998@free.fr>
 <20150817223418.6f75a2e6@free-electrons.com>
 <20150817210425.GB3988@free.fr>
Message-ID: <20150818103334.2e89300a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 17 Aug 2015 23:04:25 +0200, Yann E. MORIN wrote:

> See the discussion that got us toward this situation:
>     http://lists.busybox.net/pipermail/buildroot/2015-August/137445.html
>     http://lists.busybox.net/pipermail/buildroot/2015-August/137447.html
> 
> Basically:
>   - we no longer download from SF.net
>   - so, how relevant is it to use a SF-provided hash?

Then, just don't mention/use the SF hash in the hash file.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
