From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 00:09:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/libwebsockets: fix back static
 build with openssl
In-Reply-To: <20200125180308.3482382-1-fontaine.fabrice@gmail.com>
References: <20200125180308.3482382-1-fontaine.fabrice@gmail.com>
Message-ID: <20200203000952.0c35cfcb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 25 Jan 2020 19:03:08 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Put back an updated version of the patch that was wrongly removed when
> bumping to version 3.2.2 with commit
> 55d49a3882a657caedc27cb241ccb2a97b07e2a

There was a copy-paste issue: this hash is only 39 digits while it
should be 40 digits, there is a missing "4" at the beginning.

I fixed that and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
