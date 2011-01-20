From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Jan 2011 13:22:48 +0100
Subject: [Buildroot] [PATCH 05/10] libsamplerate: new package
In-Reply-To: <1295369680-24816-6-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Tue, 18 Jan 2011 13:54:35 -0300")
References: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
	<1295369680-24816-6-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87tyh3bw87.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/multimedia/Config.in                      |    1 +
 Gustavo>  package/multimedia/libsamplerate/Config.in        |    9 +++++++++
 Gustavo>  package/multimedia/libsamplerate/libsamplerate.mk |   17 +++++++++++++++++

 Gustavo> +++ b/package/multimedia/libsamplerate/Config.in
 Gustavo> @@ -0,0 +1,9 @@
 Gustavo> +config BR2_PACKAGE_LIBSAMPLERATE
 Gustavo> +	bool "libsamplerate"
 Gustavo> +	help
 Gustavo> +	  Secret Rabbit Code (aka libsamplerate) is a Sample Rate Converter
 Gustavo> +	  for audio. One example of where such a thing would be useful
 Gustavo> +	  is converting audio from the CD sample rate of 44.1kHz
 Gustavo> +	  to the 48kHz sample rate used by DAT players. 

You have a long line / trailing spaces her, but I've fixed
that. Committed, thanks.

-- 
Bye, Peter Korsgaard
