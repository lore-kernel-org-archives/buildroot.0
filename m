From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Jan 2011 22:41:32 +0100
Subject: [Buildroot] [PATCH] v2 Add UBI image generation support.
In-Reply-To: <1292953087-19486-1-git-send-email-julien.boibessot@free.fr>
	(julien boibessot's message of "Tue, 21 Dec 2010 18:38:07 +0100")
References: <1292953087-19486-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <87lj2ryv77.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "julien" == julien boibessot <julien.boibessot@free.fr> writes:

 julien> From: Julien Boibessot <julien.boibessot@armadeus.com>
 julien> UBI images are generated from UBIFS one (with ubinize tool) and are used by
 julien> bootloaders (eg U-Boot) to write UBIFS images directly on bare NAND FLASH
 julien> (see http://www.linux-mtd.infradead.org/faq/ubi.html).

Committed, thanks!

 julien> Changes since v1:
 julien> * change some comments/helps
 julien> * as requested by Thomas, merged fs/ubi/ in fs/ubifs/, but kept ubifs.mk and
 julien>   ubi.mk separated. (I don't know if it's really worth to merge them...)

These comments to reviewers (which shouldn't be part of the final commit
message) normally goes after the '---' line, so 'git am' doesn't include
them.

Same for the subject - The 'v2' should be in the [PATCH] square
brackets so it doesn't get included.

-- 
Bye, Peter Korsgaard
