From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jan 2015 18:58:05 +0100
Subject: [Buildroot] [PATCH 0/3 v10] Improve silent builds (branch
 yem/fabio/silent)
In-Reply-To: <cover.1420213948.git.yann.morin.1998@free.fr>
References: <cover.1420213948.git.yann.morin.1998@free.fr>
Message-ID: <20150104185805.5957c38d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri,  2 Jan 2015 16:53:37 +0100, Yann E. MORIN wrote:

> Silent builds are also nice when top-level parallel make is being used
> to reduce the output clutter.
> 
> Some downloaders, like git or wget, insist on reporting progress on
> stderr instead of stdout, so redirecting stdout is not enough, we need
> to pass the quiet information all the way down to the beackends, so
> they know they have to be silent. Sigh... :-(

Series applied, after fixing a minor typo in the first patch. Thanks to
you and Fabio for working on this!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
