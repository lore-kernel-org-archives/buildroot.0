From: Ed Spiridonov <edo.rus@gmail.com>
Date: Sat, 23 May 2020 20:53:12 +0300
Subject: [Buildroot] [PATCH] package/lz4: add option to install library
 only (without lz4 binary)
In-Reply-To: <20200523173425.15367-1-edo.rus@gmail.com>
References: <20200523173425.15367-1-edo.rus@gmail.com>
Message-ID: <CACm0Nn2rhZ7fsahQmU==i7omYGjaomAsakxL7WpY4Pxa2QMkQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I did quick check of packages that have BR2_PACKAGE_LZ4 in their
dependencies. It seems that they all need liblz4, not lz4 binary.
