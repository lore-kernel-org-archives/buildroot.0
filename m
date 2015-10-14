From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Wed, 14 Oct 2015 17:16:59 +0200
Subject: [Buildroot] =?utf-8?q?host_=C3=A2ckage_empty_dependency_list?=
Message-ID: <561E71EB.5080801@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I'd like the host variant of a package to have no dependency at all,
while its target variant has some. Specifying an empty list with

HOST_FOO_DEPENDENCIES = ""

gives me an error. Not setting HOST_FOO_DEPENDENCY or setting
HOST_FOO_DEPENDENCIES =

makes it inherit the dependencies of target variant. Is there a way to
achieve this?

Cheers,

- -- 
Sylvain Raybaud
www.green-communications.fr
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJWHnHrAAoJEEkkwl4JtJ9y1QcP/jchbmAcFgDv0+J4prUIw8l0
1Vlu/EzFIuzpcb7gaR508180fotN8azEnx75eNKWn9egwQN02inS2PvLhCn314wY
ZfI5xsg6UMv9IBghFhJiTOzw+Ja+07vXzCWj9awB0ERWTVXpGL1Ebj9Aud9Jl3Bs
rg9Bag/JulK4KppWiJ7f31oQ3M6FLGB5BZGodmHnyNuv5I+Fb/T8mAkqo4qcksml
ldvlSNRr9Q+NH1SgIgVKBOpwxLPllpTfxoC6LhmvPKD6qqzXS7YC2wSb43aod+R4
74L42tKKH9Spciyjdl3swkTimQlFjp7BVd99KZ+UzB+DZrMUn0y6Cp4yYaknCO8Y
dD0MV8DZ0fmEyOL4waYZ1LAZvawiKRLV4otTg4uTw75rNOJ6AnMQsowrfsR98x73
14u2qyiOSPyTF6V7rln33G5x9t5I7zwh5QQ/gkSvBedIU6dm1tN6nEphnQOpILUk
AlQ+ihYO6tovrytuPK3MqykMjRpgZAXHXiXcGCFC+ntw8m8osAzlszjJEGNLUVym
d74GD4rjGJtSNyO473z8k5R9sAa7AY8qpfN/0sD0mpYm+NEvxm026f0bqhP32w4q
TdjzmSODoXy2AOWZfQz7voMmZ0vWt09PtMU8RSmG4xjm+RSUtyq/TOCEU4/hbN3x
hxPYdH9o2ZcgP0p0fQ+S
=cfWW
-----END PGP SIGNATURE-----
