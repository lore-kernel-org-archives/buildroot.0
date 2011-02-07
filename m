From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Feb 2011 17:42:53 +0100
Subject: [Buildroot] [PATCH 3/4] Add dsp-tools package
In-Reply-To: <1297035905-29896-3-git-send-email-felipe.contreras@gmail.com>
	(Felipe Contreras's message of "Mon, 7 Feb 2011 01:45:04 +0200")
References: <1297035905-29896-1-git-send-email-felipe.contreras@gmail.com>
	<1297035905-29896-3-git-send-email-felipe.contreras@gmail.com>
Message-ID: <871v3jx0c2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Felipe" == Felipe Contreras <felipe.contreras@gmail.com> writes:

 Felipe> +++ b/package/dsp-tools/dsp-tools.mk
 Felipe> @@ -0,0 +1,20 @@
 Felipe> +DSP_TOOLS_VERSION=2.0
 Felipe> +DSP_TOOLS_SOURCE=dsp-tools-$(DSP_TOOLS_VERSION).tar.gz
 Felipe> +DSP_TOOLS_SITE=http://gst-dsp.googlecode.com/files/

You forgot tidsp-binaries, but I've added it - Committed, thanks.

-- 
Bye, Peter Korsgaard
