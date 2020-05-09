From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 23:19:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/capnproto: bump version to 1.8.0
In-Reply-To: <20200503063730.GA1839@coltrane>
References: <20200503063730.GA1839@coltrane>
Message-ID: <20200509231926.543cdf35@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 3 May 2020 08:37:30 +0200
Koen Martens <gmc@sonologic.nl> wrote:

> The new version requires two extra features in the
> toolchain, therefore two new toolchain options are
> added as dependencies:
> 
> * BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS

Could you give more details about this new dependency? Which build
failure did you encounter, and with which toolchain/configuration?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
