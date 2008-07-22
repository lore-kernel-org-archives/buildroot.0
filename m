From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 22 Jul 2008 16:48:33 +0200
Subject: [Buildroot] [PATCH] Fix util-linux dependencies
In-Reply-To: <bbbeeccd0807220739l51feb073pb6ebcc0726f16a53@mail.gmail.com>
References: <bbbeeccd0807220724p4ba4f00epbf48eacb73a28f9e@mail.gmail.com>
	<bbbeeccd0807220739l51feb073pb6ebcc0726f16a53@mail.gmail.com>
Message-ID: <20080722144833.GA19483@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 22, 2008 at 08:39:14AM -0600, Wade Berrier wrote:
>Patch to apply against trunk.

>+
>+comment "util-linux requires a toolchain with 'Enable RPC' selected"
>+	depends on !BR2_INET_RPC

what's that good for? You would be better off to use busybox anyway.
