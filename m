From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Mar 2013 09:30:16 +0100
Subject: [Buildroot] [PATCH 1/6] support: add kconfiglib python module
In-Reply-To: <4f58a52ecbf613882b6e31b54956ccd61ab07559.1362518799.git.s.martin49@gmail.com>
References: <cover.1362518799.git.s.martin49@gmail.com>
 <4f58a52ecbf613882b6e31b54956ccd61ab07559.1362518799.git.s.martin49@gmail.com>
Message-ID: <20130306093016.4df2799a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Tue,  5 Mar 2013 22:35:27 +0100, Samuel Martin wrote:
> diff --git a/support/scripts/readme b/support/scripts/readme
> new file mode 100644
> index 0000000..4c2d68b
> --- /dev/null
> +++ b/support/scripts/readme
> @@ -0,0 +1,11 @@
> +Readme
> +======
> +
> +Kconfiglib
> +----------
> +
> +This python module, developped by Ulf Magnusson and released "as is", is
> +fetched from:

Unfortunately, "as is" is not a license that allows us to redistribute
this code and incorporate it in a work under GPLv2. So the author
should really decide on a license. If the author really doesn't care,
he might decide to use the WTFPL or even public domain, but definitely
"as is" is not a license.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
