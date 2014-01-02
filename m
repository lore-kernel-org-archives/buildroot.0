From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jan 2014 10:08:34 +0100
Subject: [Buildroot] [PATCH] package: standardise Apache licenses
In-Reply-To: <1388574494-6906-1-git-send-email-spdawson@gmail.com>
References: <1388574494-6906-1-git-send-email-spdawson@gmail.com>
Message-ID: <20140102100834.1cf2658d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear spdawson at gmail.com,

On Wed,  1 Jan 2014 11:08:14 +0000, spdawson at gmail.com wrote:
> From: Simon Dawson <spdawson@gmail.com>
> 
> Apache licenses are referred to in a variety of ways; standardise these,
> choosing a form which does not contain whitespace.
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  package/freerdp/freerdp.mk               | 2 +-
>  package/imagemagick/imagemagick.mk       | 2 +-
>  package/ne10/ne10.mk                     | 2 +-
>  package/python-msgpack/python-msgpack.mk | 2 +-
>  package/python-pyzmq/python-pyzmq.mk     | 2 +-
>  package/python-tornado/python-tornado.mk | 2 +-
>  package/subversion/subversion.mk         | 2 +-
>  package/thrift/thrift.mk                 | 2 +-
>  package/zxing/zxing.mk                   | 2 +-
>  9 files changed, 9 insertions(+), 9 deletions(-)

Your choice matches the SPDX Identifier, which I believe is a good
idea, so:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
