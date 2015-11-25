From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 25 Nov 2015 09:19:09 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-11-24
In-Reply-To: <20151125073016.2AB38102454@stock.ovh.net>
References: <20151125073016.2AB38102454@stock.ovh.net>
Message-ID: <56557D0D.4070606@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear maintainer,

On 25/11/15 07:30, Thomas Petazzoni wrote:
> Build statistics for 2015-11-24
> ===============================

>       mipsel |                     gmp-6.0.0a | NOK | http://autobuild.buildroot.net/results/3488597208974691d407d509b2976e0a29017c9e/
>       mipsel |                     gmp-6.0.0a | NOK | http://autobuild.buildroot.net/results/3dbbeba52f8ac7dea2736e2d2eea740af8c45ad5/
>       mipsel |                     gmp-6.0.0a | NOK | http://autobuild.buildroot.net/results/34a8a894a1d23022576979b77a6678117d16ed24/
>       mipsel |                     gmp-6.0.0a | NOK | http://autobuild.buildroot.net/results/e9a645a4f2ce98b44c9478b90907598a8304dee6/
>     mips64el |                     gmp-6.0.0a | NOK | http://autobuild.buildroot.net/results/284a11ed81c4a4037d5e1ad386da67577b471c88/
>     mips64el |                     gmp-6.0.0a | NOK | http://autobuild.buildroot.net/results/16c69a0c6bbe694e13d6153e64e5ab430552ba87/

This patch fixes the problem:

http://patchwork.ozlabs.org/patch/548069/

Regards,

Vincent.
