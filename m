From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Thu, 25 Jun 2015 15:46:28 +0200
Subject: [Buildroot] version of ps
Message-ID: <558C0634.8060001@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I need to run ps with an option (-p) which is not supported by the
default busybox version. I see in busybox.config that many options for
ps aren't enabled:

# CONFIG_FEATURE_PS_WIDE is not set
# CONFIG_FEATURE_PS_LONG is not set
# CONFIG_FEATURE_PS_TIME is not set
# CONFIG_FEATURE_PS_ADDITIONAL_COLUMNS is not set
# CONFIG_FEATURE_PS_UNUSUAL_SYSTEMS is not set

One of these options probably does the thing (I've not really check
yet). If this is the case, I can either propose a patch to enable it
or add a runtime dependency to PROCPS_NG in my package. What do you
think is best?

cheers,

- -- 
Sylvain Raybaud
www.green-communications.fr
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVjAY0AAoJEEkkwl4JtJ9ycgoP/A4tG8PkCjpwZA2WGdTOW6IR
0IeETtMumMcfov9y6pOvaOzyarL+fJGo6mmToRpCR+O3guHnRx5Dadftu7RNay+X
4SekoGoX/B2nJUVG7lEczTjQXoufJLieDm1aDnTonG3v3nFAbCR7xyaAd9DhANkQ
ymg+T9t+yUGvx+ZGT8CP/xzlXYZMmb4Je7+DcVxRa/XwBkW7dW8ztMr1CKwR6mum
+2xyw0eiiXX2cNbNNapZDsfVod8wU1vh0nUs+7QBhiIziJ7QngiobjqoTiW+E2Vo
F4lKaR3BATFCUzEAgkS4Eq8iScXC2pX4BjsB4hL2Z0u3c6ouDaZUL8/0X+FTdBhN
8CbJ/ev3++7epENL+ZoWhJf2Q4zPCzBL+btIuTKs0FqcfebSvOLiXrxd82IjNwhP
GfFDDqhbNH4s3q0ChfXcJXZanMyNtlq6orQJd7EKbFNciz9LwEPezY6L7IM9lFOL
USoi1ritnIxWJOzploBEhHCRLvDkT4PNI9sIu3PaXWA9DVZHNca3F/aJVJuoGJW/
Cf4PtuoF6hRQ1vG7qxK8+lJ3OixOhpVDubSabnpse9f1CPxAuvTV9ITY+QezihAc
rTdwaa3EP5hgGqD0Cuh0D6VOO785DMJKbJqAQxkIAkdHZAbUhWtAvGLgp6KcJdkz
RPE3fv+MojOnm5kpgSaW
=MIVb
-----END PGP SIGNATURE-----
