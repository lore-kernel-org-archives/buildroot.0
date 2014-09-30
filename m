From: Richard Braun <rbraun@sceen.net>
Date: Tue, 30 Sep 2014 11:34:19 +0200
Subject: [Buildroot] Reducing buildroot compile times by reusing
 toolchain?
In-Reply-To: <20140930113024.74091a8f@free-electrons.com>
References: <A2A6A18A7161D44FBCA90D5B3AF90A2E5A484C07@AMEHLEX02.ehl.pri>
 <20140930113024.74091a8f@free-electrons.com>
Message-ID: <20140930093419.GA25049@dalaran.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 30, 2014 at 11:30:24AM +0200, Thomas Petazzoni wrote:
>  * Beyond Buildroot toolchains, there are also other toolchain
>    providers, such as Sourcery CodeBench or Linaro. Depending on the
>    architecture you're targeting, this may be interesting to explore.

There is also crosstool-ng, if you want precise control over your
toolchain, but you need to know what you're doing, and there may be
bugs that will require you to patch the toolchain. In other words,
it's a very nice solution if you can afford to validate the result.

-- 
Richard Braun
