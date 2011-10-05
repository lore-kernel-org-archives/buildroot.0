From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Oct 2011 21:51:00 +0200
Subject: [Buildroot] [PATCH 1/4] Add the picocom package
In-Reply-To: <b1bcdc61348588f371f00063e571c4d78cd8f4ae.1317636624.git.maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Mon, 3 Oct 2011 12:10:31 +0200")
References: <cover.1317636624.git.maxime.ripard@free-electrons.com>
 <cover.1317636624.git.maxime.ripard@free-electrons.com>
 <b1bcdc61348588f371f00063e571c4d78cd8f4ae.1317636624.git.maxime.ripard@free-electrons.com>
Message-ID: <87fwj7nrob.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> From: Maxime Ripard <maxime@free-electrons.com>
 Maxime> Signed-off-by: Maxime Ripard <maxime@free-electrons.com>
 Maxime> ---
 Maxime> +++ b/package/picocom/Config.in
 Maxime> @@ -0,0 +1,9 @@
 Maxime> +config BR2_PACKAGE_PICOCOM
 Maxime> +	bool "picocom"
 Maxime> +	help
 Maxime> +	   picocom is a minimal dumb-terminal emulation program. It
 Maxime> +	   is, in principle, very much like minicom, only it's pico
 Maxime> +	   instead of mini!
 Maxime> +

nitpick, help text is indented with <tab><space><space>, not 3 spaces.

 Maxime> +	   http://code.google.com/p/picocom/
 Maxime> +

You have an extra blank line here and in the .mk.

Committed with those small fixes, thanks.

-- 
Bye, Peter Korsgaard
