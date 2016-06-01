From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 22:14:23 +0200
Subject: [Buildroot] [PATCH 0/8 RFC] Adding a Go package infrastructure
In-Reply-To: <1454369465-4804-1-git-send-email-ludovic.guegan@gmail.com>
References: <1454369465-4804-1-git-send-email-ludovic.guegan@gmail.com>
Message-ID: <20160601221423.01ab45ec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ludovic,

On Tue,  2 Feb 2016 00:30:57 +0100, Ludovic Guegan wrote:

> Ludovic Guegan (8):
>   package/golang: create Go 1.5 host compiler package
>   package/golang-gb: create gb package to build and fetch go packages
>   package/pkg-generic.mk: allow custom extract directory
>   package/pkg-golang.mk: infrastructure for Go packages
>   docs/manual: documents the golang-package infrastructure
>   package/rtop: add rtop package in Go
>   package/embd: add embd package (embedded programming framework)
>   package/bolt: add bolt package (persistent key-value store)

Sorry for the slow feedback on this. We now have Go support in
Buildroot. For the moment, we only have one package in the tree
(flannel), but Christian Stewart has already submitted three more. And
indeed, the build procedure for each of them look very similar, so a
package infrastructure might very well be useful.

Would you be interested in respining your patch series against the
latest master, so that we can move forward with this topic?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
