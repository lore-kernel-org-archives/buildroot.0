From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Sat, 3 Mar 2012 21:13:38 -0200
Subject: [Buildroot] [PATCH 1/2] openssl: Fix build on ARM with GCC 4.6.x
In-Reply-To: <20120301181031.GA3915@tarshish>
References: <1330558078-3978-1-git-send-email-ismael.luceno@gmail.com>
 <20120301053726.GA4978@sapphire.tkos.co.il>
 <20120301153201.58f81290@gmail.com>
 <20120301181031.GA3915@tarshish>
Message-ID: <20120303211338.14fe3545@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 1 Mar 2012 20:10:32 +0200
Baruch Siach <baruch@tkos.co.il> wrote:
<...> 
> But BR2_GCC_VERSION_4_6_X is only available when selecting internal 
> toolchains. See toolchain/toolchain-buildroot/Config.in.

Would setting it (on the command line) produce any side-effect?

> Doesn't the patch from r183512 fix this bug?

What is "r183512" supposed to mean?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 490 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120303/0f46aab0/attachment.asc>
