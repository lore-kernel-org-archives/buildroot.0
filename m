From: Brad House <brad@mainstreetsoftworks.com>
Date: Mon, 06 Aug 2007 16:57:31 -0400
Subject: [Buildroot] [patch] libxml2 fixes
In-Reply-To: <02f001c7d869$de70f960$dcc4af0a@atmel.com>
References: <46B739FF.5020507@mainstreetsoftworks.com>
	<02f001c7d869$de70f960$dcc4af0a@atmel.com>
Message-ID: <46B78B3B.1070002@mainstreetsoftworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> When I tried to build libxml2 using a toolchain without wchar support
> it failed, when it is built with a toolchain supporting wchar, it completes the build.

When was this and with what version of libxml2, and on what architecture?
On x86 and arm, that is not the case from my experience.
Can you also provide some more information on the actual error message?

Thanks.
-Brad
