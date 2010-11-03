From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 03 Nov 2010 23:27:38 +0100
Subject: [Buildroot] [PATCH 2/8] Makefile: move version string from
	Config.in into Makefile
In-Reply-To: <1288542916-21883-3-git-send-email-yann.morin.1998@anciens.enib.fr>
	(Yann E. MORIN's message of "Sun, 31 Oct 2010 17:35:10 +0100")
References: <1288542916-21883-1-git-send-email-yann.morin.1998@anciens.enib.fr>
	<1288542916-21883-3-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <87zktq9h5x.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> This re-instates writing the version string in .config headers, and no
 Yann> longer provides it as a kconfig symbol in .config (it is now a variable
 Yann> in the Makefile, and in the environment).

 Yann> We use the full version string, that contains the local signature.

No, that is only added in 4/8.

-- 
Bye, Peter Korsgaard
