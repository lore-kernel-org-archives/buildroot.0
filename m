From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 6 Jul 2017 19:18:39 +0200
Subject: [Buildroot] [PATCH 1/1] Add BR2_TOOLCHAIN_HAS_FTS config option
In-Reply-To: <20170706152346.30242-1-aduskett@codeblue.com>
References: <20170706152346.30242-1-aduskett@codeblue.com>
Message-ID: <20170706171838.GB31734@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Adam Duskett wrote,

> Currently there are a few packages in buildroot that are set to not
> be selectable unless the user wishes to use glibc specifically because
> the package uses fts.h.
> 
> uClibc actually does have a fts implimentation, and it's selectable in
> uclib-menuconfig.  However; this has two issues with it:

Can we just enable fts by default?
That was something I was going to suggest anyway :=)
People requiring a really small uClibc-ng system, will use a custom
uClibc-ng config.

We shouldn't add a new option, we already removed most of them.

best regards
 Waldemar
