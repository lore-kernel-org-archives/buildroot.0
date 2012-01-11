From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Jan 2012 18:37:14 +0100
Subject: [Buildroot] [PATCH 2/2] Update the CHANGES file to mention this
	new policy
In-Reply-To: <d9bcbeac65110789d393278b8984823864083c52.1326301656.git.maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Wed, 11 Jan 2012 18:09:23 +0100")
References: <cover.1326301656.git.maxime.ripard@free-electrons.com>
 <cover.1326301656.git.maxime.ripard@free-electrons.com>
 <d9bcbeac65110789d393278b8984823864083c52.1326301656.git.maxime.ripard@free-electrons.com>
Message-ID: <87zkdu87jp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 Maxime> ---
 Maxime>  CHANGES |    3 +++
 Maxime>  1 files changed, 3 insertions(+), 0 deletions(-)

 Maxime> diff --git a/CHANGES b/CHANGES
 Maxime> index 515e3db..5c1e9c9 100644
 Maxime> --- a/CHANGES
 Maxime> +++ b/CHANGES
 Maxime> @@ -10,6 +10,9 @@
 
 Maxime>  	uClibc: remove 0.9.30, backport unshare() support.
 
 Maxime> +	Buildroot now calls the stop function of scripts in /etc/init.d at
 Maxime> +	shutdown.

Thanks. In general I prefer to maintain CHANGES myself, as we otherwise
easily get merge conflicts (like now), but I've fixed up the conflict
and committed.

-- 
Bye, Peter Korsgaard
