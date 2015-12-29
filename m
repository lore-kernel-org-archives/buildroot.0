From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Dec 2015 00:14:03 +0100
Subject: [Buildroot] [PATCH] iptables: bump to version 1.6.0
In-Reply-To: <1450641927-24986-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 20 Dec 2015 17:05:27 -0300")
References: <1450641927-24986-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877fjwalvo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

> Add option for nftables compat utilies and for bpf compiler/nfsynproxy
> configuration tool.

> Drop symlink trickery since it's not required any more.

> Switch homepage to proper one and drop the kernel v2.4+ note since
> that's not supported by buildroot anyway.

> Drop most patches (except musl build) since they're upstream.

> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
