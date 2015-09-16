From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Sep 2015 22:22:14 +0200
Subject: [Buildroot] [v3 2/2] openssl: enable parallel build and
 installation
In-Reply-To: <1442405185-4103-3-git-send-email-ryanbarnett3@gmail.com>
References: <1442405185-4103-1-git-send-email-ryanbarnett3@gmail.com>
 <1442405185-4103-3-git-send-email-ryanbarnett3@gmail.com>
Message-ID: <20150916222214.7807f6d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Wed, 16 Sep 2015 07:06:25 -0500, Ryan Barnett wrote:
> This is a patch that is originally based on a patch Thomas P.
> submitted for an earlier version of this package. I have adopted this
> patch to use the latest available Gentoo parallel patch. I have also
> seen about a minute improvement on my build times of openssl.
> 
> Part of Thomas P's original message:
> 
> On my build server, the current build of OpenSSL takes 1 minutes and
> 20 seconds. With this commit applied, enabling parallel build and
> installation, the build only takes 28 seconds.
> 
> All the patches are downloaded from Gentoo.
> 
> There is apparently some interest in upstream OpenSSL to enable
> parallel build, see for example commit
> https://github.com/openssl/openssl/commit/c3f22253b139793ff3b91ff7e6969e180cf06815. This
> commit is not part of any OpenSSL release, but we can hope that the
> problem will resolved in the future.
> 
> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
> CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> CC: Gustavo Zacarias <gustavo@zacarias.com.ar>
> CC: Arnout Vandecappelle <arnout@mind.be>
> 
> ---
> Changes from v2 to v3:
>  - No changes

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
