From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 2 Jan 2014 13:47:06 +0100
Subject: [Buildroot] [PATCH] package: standardise Apache licenses
In-Reply-To: <1388574494-6906-1-git-send-email-spdawson@gmail.com>
References: <1388574494-6906-1-git-send-email-spdawson@gmail.com>
Message-ID: <CAAXf6LUTz67E0unP8FVz6YqPDnE=NqnoS3ufurZO_ejprPs+0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon,

On Wed, Jan 1, 2014 at 12:08 PM,  <spdawson@gmail.com> wrote:
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

Could you also update the license abbreviation list in the manual?
http://buildroot.uclibc.org/downloads/manual/manual.html#legal-info-list-licenses

Thanks,
Thomas
