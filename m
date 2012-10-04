From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Oct 2012 22:41:12 +0200
Subject: [Buildroot] [PATCH v8 03/11] perl: add an option for miniperl
In-Reply-To: <1348593508-14254-3-git-send-email-francois.perrad@gadz.org>
References: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
 <1348593508-14254-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <20121004224112.4c46e707@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois,

On Tue, 25 Sep 2012 19:18:19 +0200, Francois Perrad wrote:

> diff --git a/package/perl/perl-install-miniperl.patch b/package/perl/perl-install-miniperl.patch
> new file mode 100644
> index 0000000..7e6f8e6
> --- /dev/null
> +++ b/package/perl/perl-install-miniperl.patch
> @@ -0,0 +1,129 @@
> +Add an option -miniperl
> +
> +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Does this (fairly long) patch has a chance of being merged upstream? If
not, then I'd prefer if we simply didn't support miniperl.

Otherwise, it looks ok.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
