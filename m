From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Thu, 09 Jul 2015 14:16:32 +0200
Subject: [Buildroot] [PATCH 5/7] Add fancy options to busybox sleep,
 like float arguments
In-Reply-To: <20150704111239.7de95201@free-electrons.com>
References: <1435929086-21205-1-git-send-email-sylvain.raybaud@green-communications.fr>	<1435929086-21205-6-git-send-email-sylvain.raybaud@green-communications.fr>
 <20150704111239.7de95201@free-electrons.com>
Message-ID: <559E6620.2080603@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Thomas,

On 04/07/2015 11:12, Thomas Petazzoni wrote:
> Dear Sylvain Raybaud,
> 
> On Fri,  3 Jul 2015 15:11:24 +0200, Sylvain Raybaud wrote:
>> Signed-off-by: Sylvain Raybaud
>> <sylvain.raybaud@green-communications.fr> --- 
>> package/busybox/busybox.config | 4 ++-- 1 file changed, 2
>> insertions(+), 2 deletions(-)
>> 
>> diff --git a/package/busybox/busybox.config
>> b/package/busybox/busybox.config index 9d930d1..8d1d80a 100644 
>> --- a/package/busybox/busybox.config +++
>> b/package/busybox/busybox.config @@ -273,8 +273,8 @@
>> CONFIG_SHA256SUM=y CONFIG_SHA512SUM=y CONFIG_SHA3SUM=y 
>> CONFIG_SLEEP=y -# CONFIG_FEATURE_FANCY_SLEEP is not set -#
>> CONFIG_FEATURE_FLOAT_SLEEP is not set 
>> +CONFIG_FEATURE_FANCY_SLEEP=y +CONFIG_FEATURE_FLOAT_SLEEP=y 
>> CONFIG_SORT=y CONFIG_FEATURE_SORT_BIG=y # CONFIG_SPLIT is not
>> set
> 
> Can you include in the commit information about the size different
> of the resulting Busybox binary before/after this patch?
> 
> Thanks a lot!
> 
> Thomas
> 

It seems to add 2748 bytes on i386 and 492 bytes on arm. Should I
mention the first only? both? Do you think 2748 is too heavy for
considering this patch for inclusion?

Cheers,

Sylvain

- -- 
Sylvain Raybaud
www.green-communications.fr
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVnmYgAAoJEEkkwl4JtJ9yOecP/3N/fwbgu/VaEK1er7NZ3qeC
70QfPJGJy5o6nL0WgO49xo6kKFzbsMv7s7o+Ee9ECh42JKKXjgz33Rkpl1E2rWzL
Vt/GONiLhxNt5JhnuPsHqWHUO+ZeFfDaFcrcwCF81IYwW6pLAS85eQW+3Vot0Wbz
I7LEPEd715voMlqdXAE+vDwVsLCUGqOJ5U+Rzfn3IGsJ4MhPpakQRkPPAfQ/LH+z
hrxyR2PWLNFUBiumrV90lilZlbOVWYREE2ox/qQGzmvvd6OILHVJLfGyLYEq7s/N
3I9x4++ci2hX10OHybp7GXQqO0FZRFgxEubNAezx8Hi3jpcmhDUg9EUAQcZK/TA3
znfAEiMi59LXCFuW9SMBlBbig5NHEeBIR/sRRLPr4X+LC7JatyGjF9+J4dz9GPxc
8p49OJD5JOu3JIrRIzmvDm+6j7doytXXrwE+9+Bc1MYWsX4SMAT4a3k40OteIr/M
GySCC8spupDKTe9hVb3ULvgfumYvKnJIbPQCQ252/Dc6hQ0n3D1Gr4q6axYCoRgx
ZobAkaDNpLpL30cCJWWrrBo1sHGXa9XVsGYa1Bv6YOnvZYzzDRbKXggBcZi0i071
cUBBc3bin27pNmY1N65goBSJhHQBh3Ahq4jY5kq9zhleZ2vTNI4wn454ZVoGcrdA
e8kTIiW/pb3zflQIVF41
=gNz5
-----END PGP SIGNATURE-----
