From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Jan 2011 09:39:29 +0100
Subject: [Buildroot] [PATCH 3rd RESEND 2/6] Fix gstreamer packages for
	make 3.82
In-Reply-To: <1295822495-16972-3-git-send-email-felipe.contreras@gmail.com>
	(Felipe Contreras's message of "Mon, 24 Jan 2011 00:41:31 +0200")
References: <1295822495-16972-1-git-send-email-felipe.contreras@gmail.com>
	<1295822495-16972-3-git-send-email-felipe.contreras@gmail.com>
Message-ID: <877hduitku.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Felipe" == Felipe Contreras <felipe.contreras@gmail.com> writes:

 Felipe> These packages would get fixed on the next releases, but each one gets
 Felipe> released at different periods. For now this is needed to build on 3.82.

 Felipe> I only tested gstreamer, gst-plugins-base, and
 Felipe> gst-plugins-good, but all the ones using the 'common' submodule
 Felipe> should have this issue.

There recently were a number of new gst-* releases. I took a quick look
at gst-plugins-base-0.10.32, an no longer see that gtkdoc line.
Wouldn't it make more sense to update now instead of adding this hack?

-- 
Bye, Peter Korsgaard
