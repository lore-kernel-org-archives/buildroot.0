From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Sep 2015 22:22:08 +0200
Subject: [Buildroot] [v3 1/2] openssl: use git formatted patches
In-Reply-To: <1442405185-4103-2-git-send-email-ryanbarnett3@gmail.com>
References: <1442405185-4103-1-git-send-email-ryanbarnett3@gmail.com>
 <1442405185-4103-2-git-send-email-ryanbarnett3@gmail.com>
Message-ID: <20150916222208.64dc6ce0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan,

On Wed, 16 Sep 2015 07:06:24 -0500, Ryan Barnett wrote:

> +Subject: [1/2] Dont waste time building manpages if we're not going to use em.

Arnout also suggested to get rid of [1/2] (and [2/2] for the second
patch), since this information becomes obsolete when we add a new patch.

I've applied after doing this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
