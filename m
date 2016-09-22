From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Sep 2016 12:25:21 +0200
Subject: [Buildroot] [PATCH 3/3] Patches to update at91bootstrap3
 package to 3.8.6 version
In-Reply-To: <1474537834-6002-3-git-send-email-biagio.hkr@gmail.com>
References: <1474537834-6002-1-git-send-email-biagio.hkr@gmail.com>
 <1474537834-6002-3-git-send-email-biagio.hkr@gmail.com>
Message-ID: <20160922122521.436eb0b5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Sep 2016 11:50:34 +0200, Biagio Montaruli wrote:

> -sha256	ae7bb3f8e631f5216f05fd4650b37f2e76d88d0b893bd680f4f398f33b8f3470  at91bootstrap3-v3.8.tar.gz
> +sha256	a2e9ec6f42ee3b5a805fe215257b63070b6c498d57c568c46fcb18fd1b38ea7e  at91bootstrap-3.8.6.tar.gz

Filename should be:

	at91bootstrap3-v3.8.6.tar.gz

since we're not yet checking hashes for Git-fetched packages you didn't
see the difference.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
