From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 13 Dec 2015 10:58:39 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-12-12
In-Reply-To: <20151213073021.B22AB10164A@stock.ovh.net>
References: <20151213073021.B22AB10164A@stock.ovh.net>
Message-ID: <1450000719.6489.2.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On So, 2015-12-13 at 08:30 +0100, Thomas Petazzoni wrote:
> Build statistics for 2015-12-12
> ===============================
> 
> ?????????arm |???????????????????boost-1.59.0 | NOK |
> http://autobuild.buildroot.net/results/1660b2fb373b375aed82242d277003
> 901443c57f/
> ??????mipsel |???????????????????boost-1.59.0 | NOK | http://autobuil
> d.buildroot.net/results/a4f7e4c00acf1ba2c826ff8a93b98301e71be655/
> ?????powerpc |???????????????????boost-1.59.0 | NOK | http://autobuil
> d.buildroot.net/results/e0acc7ee67c6bee20d98586e70317e24bad1c2ba/
> ?????powerpc |???????????????????boost-1.59.0 | NOK | http://autobuil
> d.buildroot.net/results/23078923dcd9bbe0c3aae95833c75f1d53596e15/

<fenv.h> exists, but does not define?FE_DIVBYZERO and co. Is this true
for all uclibc-based toolchains or is it dependent of the architecture?

Best regards
J?rg Krause
