From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 13:47:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/exim: fix CC and LNCC
 initialization
In-Reply-To: <20200719102946.1646674-1-alejandro.gonzalez.correo@gmail.com>
 ("Alejandro =?utf-8?Q?Gonz=C3=A1lez=22's?= message of "Sun, 19 Jul 2020
 12:29:46 +0200")
References: <20200719102946.1646674-1-alejandro.gonzalez.correo@gmail.com>
Message-ID: <878sfbhiuz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alejandro" == Alejandro Gonz?lez <alejandro.gonzalez.correo@gmail.com> writes:

 > When using ccache to build the exim package, the
 > HOSTCC value contains characters that are incorrectly
 > interpreted by exim's Makefile, presumably spaces. This
 > breaks the build with "unrecognized option" ccache errors.

 > Fix that by wrapping the HOSTCC variable in double quotes,
 > as it is done for other variables that follow.

 > Signed-off-by: Alejandro Gonz?lez <alejandro.gonzalez.correo@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
