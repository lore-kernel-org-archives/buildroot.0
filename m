From: Brendan Heading <brendanheading@gmail.com>
Date: Sun, 2 Aug 2015 22:28:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/arptables: fix musl compilation
	issues
In-Reply-To: <20150802201211.GJ3647@free.fr>
References: <1438542614-2069-1-git-send-email-brendanheading@gmail.com>
 <20150802201211.GJ3647@free.fr>
Message-ID: <CA+BsyQ7D9PjQaA45GXfbHFAnUaD76+_4mcY6QiBBNEtjU3GCkQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> This is not exactly the patch that was applied by upstream:
>     http://git.netfilter.org/arptables/commit/?id=047f37b1d5d865084a435fd7594b8c5c332ccb8d
>
> The patch you provide is missing two hunks which are upstream...

Yann,

That is correct - I had to rebase the patch against the 0.14 release
(it did not apply cleanly).

Brendan
