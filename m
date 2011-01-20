From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Jan 2011 15:15:16 +0100
Subject: [Buildroot] [PATCH 07/10] libreplaygain: new package
In-Reply-To: <4D38301F.5000406@zacarias.com.ar> (Gustavo Zacarias's message of
	"Thu, 20 Jan 2011 09:52:47 -0300")
References: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
	<1295369680-24816-8-git-send-email-gustavo@zacarias.com.ar>
	<87lj2fbuw0.fsf@macbook.be.48ers.dk>
	<4D38301F.5000406@zacarias.com.ar>
Message-ID: <874o93br0q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> +LIBREPLAYGAIN_VERSION =  r453
 Gustavo> +LIBREPLAYGAIN_SITE = http://files.musepack.net/source
 Gustavo> +LIBREPLAYGAIN_SOURCE = libreplaygain_$(LIBREPLAYGAIN_VERSION).tar.gz
 Gustavo> +LIBREPLAYGAIN_AUTORECONF = YES
 >> 
 >> Why autoreconf?

 Gustavo> Why don't they ship configure? :-)

Ahh ok. Committed with a comment about why we need autoreconf. Thanks.

-- 
Bye, Peter Korsgaard
