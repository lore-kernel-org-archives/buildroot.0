From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 09:41:12 +0200
Subject: [Buildroot] [PATCH 1/1] llvm: disable bindings on host
In-Reply-To: <20191024230607.986468-1-joseph.kogut@gmail.com>
References: <20191024230607.986468-1-joseph.kogut@gmail.com>
Message-ID: <20191025094112.1aa6e225@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joseph,

On Thu, 24 Oct 2019 16:06:07 -0700
Joseph Kogut <joseph.kogut@gmail.com> wrote:

> Additionally, remove GO_EXECUTABLE=GO_EXECUTABLE-NOTFOUND and
> OCAMLFIND=OCAMLFIND-NOTFOUND, as these options are no longer necessary.

This should be done as a separate patch.

And also, the commit log should carry an explanation as to why we want
to disable the bindings on the host. And in fact, what those bindings
are in the first place.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
