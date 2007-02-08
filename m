From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 8 Feb 2007 18:23:18 +0100
Subject: [Buildroot] First Step in allowing Static / shared library
	choice
In-Reply-To: <8867285.post@talk.nabble.com>
References: <8867285.post@talk.nabble.com>
Message-ID: <20070208172318.GA8945@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 08, 2007 at 07:18:08AM -0800, Daniel Laird wrote:
>
>Following on from my question of 'how do we deal with shared and static
>builds"
>I enclose the following patch.
>This is for the top level Config.in
>It will appear under Build options
>this means that the variables BR2_STATIC_LIBS and BR2_SHARED_LIBS are
>available.
>
>Once this patch is in we can start to modify packages to use this
>information. (no packages modified yet)

Sounds good.

Can you please also add $(BR2_ENABLE_SHARED) rsp. $(BR2_ENABLE_STATIC)
variables (and the corresponding DISABLE) that get passed to
TARGET_CONFIGURE_OPTS (spelling?) to toolchain/Makefile.in or an
appropriate place?

TIA,
