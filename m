From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Jan 2011 13:13:40 +0100
Subject: [Buildroot] [PATCH 04/10] wavpack: new package
In-Reply-To: <1295369680-24816-5-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Tue, 18 Jan 2011 13:54:34 -0300")
References: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
	<1295369680-24816-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8739ondb7v.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Add new wavpack package, another lossless codec like flac.
 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/multimedia/Config.in          |    1 +
 Gustavo>  package/multimedia/wavpack/Config.in  |   10 ++++++++++
 Gustavo>  package/multimedia/wavpack/wavpack.mk |   12 ++++++++++++
 Gustavo>  3 files changed, 23 insertions(+), 0 deletions(-)
 Gustavo>  create mode 100644 package/multimedia/wavpack/Config.in
 Gustavo>  create mode 100644 package/multimedia/wavpack/wavpack.mk

It seems like it needs iconv:

checking for ANSI C header files... (cached) yes
checking for cos in -lm... yes
checking host system type... (cached) powerpc-unknown-linux-gnu
checking iconv.h usability... no
checking iconv.h presence... no
checking for iconv.h... no
configure: error: Can't find iconv headers.
make[1]: ***
[/home/peko/source/buildroot/output2/build/wavpack-4.60.1/.stamp_configured]
Error 1

Care to fix and resend?

-- 
Bye, Peter Korsgaard
