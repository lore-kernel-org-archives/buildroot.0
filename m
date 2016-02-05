From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 5 Feb 2016 10:02:41 -0300
Subject: [Buildroot] [PATCH] uclibc: fix MIPS builds with disabled
	threads
In-Reply-To: <20160205063435.GA22677@waldemar-brodkorb.de>
References: <20160205063435.GA22677@waldemar-brodkorb.de>
Message-ID: <56B49D71.5060004@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/02/16 03:34, Waldemar Brodkorb wrote:

> There was a regression found while building for MIPS
> with disabled threads. Upstream patch fixed it.
>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
