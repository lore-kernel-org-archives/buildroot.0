From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 29 Oct 2017 13:51:48 +0100
Subject: [Buildroot] [PATCH] uftrace: new package
In-Reply-To: <20170625193743.8424-1-vincent.stehle@laposte.net>
References: <20170625193743.8424-1-vincent.stehle@laposte.net>
Message-ID: <20171029125148.GA2290@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!
On 17-06-25 21:37:43, Vincent Stehle wrote:
> From: Vincent Stehl? <vincent.stehle@laposte.net>
>
> Add a package for uftrace, a simple function call tracer for user programs.

Any update on this patch series?
>
> The x86_64 and arm/aarch64 architectures are supported.
>
> Tracing necessitates that the executable you want to trace be compiled with
> -pg or -finstrument-functions option.

How can those flags be passed when compiling Buildroot packages?

Regards,

--
ELB
