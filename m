From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 18 Dec 2013 10:47:25 +0100
Subject: [Buildroot] [PATCH v5 2/2] manual: update for multiple global
	patch dirs
In-Reply-To: <1387291730-6513-2-git-send-email-rjbarnet@rockwellcollins.com>
References: <1387291730-6513-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1387291730-6513-2-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <CAAXf6LUygcB8Zn6Pq+0og6xCeo5_UkkLUPY6ziGXNtMKOVyR0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan,

On Tue, Dec 17, 2013 at 3:48 PM, Ryan Barnett
<rjbarnet@rockwellcollins.com> wrote:
[..]

> +The exception to +BR2_GLOBAL_PATCH_DIR+ being the preferred method for
> +specifying custom patches is +BR2_LINUX_KERNEL_PATCH+.
> ++BR2_LINUX_KERNEL_PATCH+ should be used to specify kernel patches that
> +are available at an URL. *Note:* +BR2_LINUX_KERNEL_PATCHES+ are applied
> +after patches available in +BR2_GLOBAL_PATCH_DIR+ as it is a patch
> +post-hook step for the Linux package.

In v4 I had following comment on this sentence:
-----
'a patch post-hook step for the Linux package' sounds odd.
What about:
..., as it is done from a post-patch hook of the Linux package.
-----

Of course, you don't have to agree on this, but as I did not see any
response on it I think it may have simply been overlooked.

Best regards,
Thomas
