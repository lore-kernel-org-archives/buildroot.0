From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 21:51:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-cbor2: new package
In-Reply-To: <20200213062614.17118-1-james.hilliard1@gmail.com>
References: <20200213062614.17118-1-james.hilliard1@gmail.com>
Message-ID: <20200412215143.675831e9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 12 Feb 2020 23:26:14 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Pure Python CBOR (de)serializer with extensive tag support.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  DEVELOPERS                             |  1 +
>  package/Config.in                      |  1 +
>  package/python-cbor2/Config.in         |  6 ++++++
>  package/python-cbor2/python-cbor2.hash |  5 +++++
>  package/python-cbor2/python-cbor2.mk   | 14 ++++++++++++++
>  5 files changed, 27 insertions(+)
>  create mode 100644 package/python-cbor2/Config.in
>  create mode 100644 package/python-cbor2/python-cbor2.hash
>  create mode 100644 package/python-cbor2/python-cbor2.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
