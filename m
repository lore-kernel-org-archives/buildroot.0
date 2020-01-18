From: Alex Corcoles <alex@corcoles.net>
Date: Sat, 18 Jan 2020 19:46:46 +0100
Subject: [Buildroot] "PATCH": hack to be able to build Rust targetting MIPS
In-Reply-To: <CAPAYC_xPtDO=j3fWeOEbC41X3PXJZ+7AD=WRm8A1DGQrtbadFQ@mail.gmail.com>
References: <CAPAYC_xPtDO=j3fWeOEbC41X3PXJZ+7AD=WRm8A1DGQrtbadFQ@mail.gmail.com>
Message-ID: <CAPAYC_y98TxMoBtG=P9hDe26=1rHfaoMyoH5NJyLHbRxcxpMAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

I'm trying to build mipsel Rust stuff, and I've had to do this:

8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8< 8<
