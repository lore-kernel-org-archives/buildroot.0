From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 12 Dec 2013 14:08:24 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #3 (deadline
	December 20)
In-Reply-To: <CAAXf6LXUx3dERdYxq5d4mY8apxXk+Ltj_CNPm+RTM+52nKRUNA@mail.gmail.com>
References: <CAAXf6LXUx3dERdYxq5d4mY8apxXk+Ltj_CNPm+RTM+52nKRUNA@mail.gmail.com>
Message-ID: <CAAXf6LXjTtbN96pWCvmXVEWHXM5Fcb53weJWXaqjZYx1Qb73mw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Valentine,

On Fri, Dec 6, 2013 at 10:02 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:

> [1/2] Makefile: Fix target-purgelocales
> Valentine Barshak <gvaxon@gmail.com>
> http://patchwork.ozlabs.org/patch/188623
>
> [2/2] Makefile: Add /usr/lib/locale to target-purgelocales
> Valentine Barshak <gvaxon@gmail.com>
> http://patchwork.ozlabs.org/patch/188624

At first sight these patches are still relevant. Could you confirm this?

Regarding the second patch: could you give some examples of packages
that install locale data in /usr/lib/locale? Are these packages that
are in mainline buildroot?

Thanks,
Thomas
