From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Feb 2019 22:23:09 +0100
Subject: [Buildroot] [PATCH] package/luvi: bump to version 2.9.0 to fix
 build with OpenSSL 1.1.1a
In-Reply-To: <20190219204401.5326-1-joerg.krause@embedded.rocks>
References: <20190219204401.5326-1-joerg.krause@embedded.rocks>
Message-ID: <58f352e4-4bed-ff13-70e0-929029a8574a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/02/2019 21:44, J?rg Krause wrote:
> Bump to latest release that bundles lua-openssl 0.7.4 to fix compatibility
> with OpenSSL 1.1.1a.
> 
> Drop patches 0001 and 0002 that are included in the new release.
> 
> Successfully build and runtime tested on Banana Pro, note that version string
> for lua-openssl does not match the tag name (0.7.4):
> 
> ```
> luvi v2.9.0
> zlib: 1.2.11
> libuv: 1.25.0
> ssl: OpenSSL 1.1.1a  20 Nov 2018, lua-openssl 0.7.3
> ```
> 
> Fixes:
> http://autobuild.buildroot.net/results/e87994a3dc987f5aa101a5e721ac927e21453373
> http://autobuild.buildroot.net/results/ea725ad90cfcd3c5e242268a593dcabd7297fe70
> http://autobuild.buildroot.net/results/f2fb9eea0044e4a5f674742d29ea95af49cf5a45
> http://autobuild.buildroot.net/results/de4daa1b930f907f06640dc98a708016217ddea5
> .. and many more.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

 Bumping 2 years worth of versions during the -rc cycle is not something we
normally do, but most changes are anyway bumps of the submodules, and there is
no trivial way to fix it otherwise, so I've applied to master, thanks.

 Regards,
 Arnout
