From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Dec 2019 22:30:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-aiozipkin: new package
In-Reply-To: <20191211062928.107541-1-james.hilliard1@gmail.com>
References: <20191211062928.107541-1-james.hilliard1@gmail.com>
Message-ID: <20191214223018.1a742938@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Dec 2019 23:29:28 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Distributed tracing instrumentation for asyncio application
> with zipkin.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  DEVELOPERS                                     |  1 +
>  package/Config.in                              |  1 +
>  package/python-aiozipkin/Config.in             |  9 +++++++++
>  package/python-aiozipkin/python-aiozipkin.hash |  5 +++++
>  package/python-aiozipkin/python-aiozipkin.mk   | 14 ++++++++++++++
>  5 files changed, 30 insertions(+)
>  create mode 100644 package/python-aiozipkin/Config.in
>  create mode 100644 package/python-aiozipkin/python-aiozipkin.hash
>  create mode 100644 package/python-aiozipkin/python-aiozipkin.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
