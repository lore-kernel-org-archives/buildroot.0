From: Adam McLaurin <buildroot@irotas.net>
Date: Mon, 03 Nov 2008 09:33:52 -0500
Subject: [Buildroot] How to build a gcc-3.3 toolchain
In-Reply-To: <87ej1uz0yc.fsf@macbook.be.48ers.dk>
References: <1225463596.29685.1282290569@webmail.messagingengine.com>
	<87ej1uz0yc.fsf@macbook.be.48ers.dk>
Message-ID: <1225722832.28602.1282706045@webmail.messagingengine.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 02 Nov 2008 14:55:55 +0100, "Peter Korsgaard"
<jacmet@uclibc.org> said:
> You could probably change the existing 3.4.6 support (remember to
> enable BR2_DEPRECATED) to compile a 3.3 gcc instead.

Thanks for the response.

Should I start by copying everything in 'toolchain/gcc/3.4.6' to
'toolchain/gcc/3.3.6', or create the 3.3.6 directory clean and add
patches as necessary? I'm not sure how well those patches will backport
to 3.3.6.

Thanks,
Adam
