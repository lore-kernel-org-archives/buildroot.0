From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Jan 2011 09:42:11 +0100
Subject: [Buildroot] [PATCH 3rd RESEND 1/6] gstreamer: remove
	unnecessary feature
In-Reply-To: <1295822495-16972-2-git-send-email-felipe.contreras@gmail.com>
	(Felipe Contreras's message of "Mon, 24 Jan 2011 00:41:30 +0200")
References: <1295822495-16972-1-git-send-email-felipe.contreras@gmail.com>
	<1295822495-16972-2-git-send-email-felipe.contreras@gmail.com>
Message-ID: <8739oiitgc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Felipe" == Felipe Contreras <felipe.contreras@gmail.com> writes:

 Felipe> On 0.10.11 the binary-registry was added, on 0.10.12 the
 Felipe> libxml2 dependency was dropped when binary-registry was used,
 Felipe> on 0.10.18 the binary-registry was made default, and on 0.10.23
 Felipe> it was the only option.

 Felipe> So, libxml2 is not needed any more for the registry.

Committed, thanks.

-- 
Bye, Peter Korsgaard
