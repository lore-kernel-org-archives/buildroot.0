From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Dec 2014 21:43:20 +0100
Subject: [Buildroot] [PATCH] toolchain-external: add hashes for Blackfin
 toolchains
In-Reply-To: <1419706685-13020-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1419706685-13020-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141227204320.GM4098@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-27 19:58 +0100, Thomas Petazzoni spake thusly:
> Those toolchains are downloaded from Sourceforge, and are therefore
> affected by the Sourcefoge download issues. Therefore, this commit
> adds the hashes for those toolchain tarballs.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/fa5/fa5e38246dddd661f1d674f3521d21297796bce3/
>   (and other similar issues)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Manually checked the hashes to be OK.

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  toolchain/toolchain-external/toolchain-external.hash | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
> index 7e64d4f..b4fb5e0 100644
> --- a/toolchain/toolchain-external/toolchain-external.hash
> +++ b/toolchain/toolchain-external/toolchain-external.hash
> @@ -5,3 +5,12 @@ md5  ad4a66e4791606c5df70f48c4a97b0ec  mips-2014.11-22-mips-linux-gnu-i686-pc-li
>  md5  14facaac538a43533b89d969d7904d46  mips-2014.05-27-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
>  # From: https://sourcery.mentor.com/GNUToolchain/release2640
>  md5  0ba8bc4923c04728ee3787bed4cd5148  mips-2013.11-36-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
> +
> +# Blackfin toolchains from Analog Devices
> +# Locally computed
> +sha256 fba010929c7355a0286fc4b1817d6065ee21380d3c2993383d3778f0b998ca9d  blackfin-toolchain-2012R2-RC2.i386.tar.bz2
> +sha256 90284fe72125f381817da505b6f91f2b0c86a763ffe2c722c7d6b3ae60b25010  blackfin-toolchain-2013R1-RC1.i386.tar.bz2
> +sha256 e424e90d8481d942a40266d78d1488726561fed3ec38403094f98055e61889d0  blackfin-toolchain-2014R1-RC2.i386.tar.bz2
> +sha256 436ca3d901b152094cd6be2b6e274c59643387f46bb0563db1adcab1202f1455  blackfin-toolchain-uclibc-full-2012R2-RC2.i386.tar.bz2
> +sha256 4d66a3390ae9e1c4b9aad214757791a5e0c45ef2bb31977fa6d3a80d96290237  blackfin-toolchain-uclibc-full-2013R1-RC1.i386.tar.bz2
> +sha256 c65b1b4b918d5185349d62a3b7bf43b4b21e1175c52598ec047ca56b3f11d857  blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141227/34e2ea2d/attachment.asc>
