From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 14:31:33 +0200
Subject: [Buildroot] [PATCH v3] infra: Add PRE_*_HOOKS for every step
In-Reply-To: <1396031372-23308-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1396031372-23308-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140406143133.69594f69@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Mar 2014 19:29:32 +0100, Maxime Hadjinlian wrote:

> +* +LIBFOO_PRE_LEGAL_INFO_HOOKS+
>  * +LIBFOO_POST_LEGAL_INFO_HOOKS+

I'm generally fine with the patch, but I'm wondering what's the
usefulness of the legal-info hooks. I know you're merely adding a
pre-hook to match an existing post-hook, but I'm wondering what would
be the usage of a post-legal-info hook actually.

Luca?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
