From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 May 2012 10:54:27 +0200
Subject: [Buildroot] [PATCH] jquery-ui: new package
In-Reply-To: <1337071203-5841-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Tue, 15 May 2012 09:40:03 +0100")
References: <1337071203-5841-1-git-send-email-spdawson@gmail.com>
Message-ID: <87wr4dvn7g.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>

 spdawson> +JQUERY_UI_VERSION = 1.8.20
 spdawson> +JQUERY_UI_SITE = http://jqueryui.com/download
 spdawson> +JQUERY_UI_SOURCE = jquery-ui-$(JQUERY_UI_VERSION).custom.zip
 spdawson> +
 spdawson> +JQUERY_UI_THEME = smoothness

I've looked at adding it myself, but the problem is the theming. How do
you expect to handle this?

-- 
Bye, Peter Korsgaard
