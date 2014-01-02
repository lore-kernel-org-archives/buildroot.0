From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jan 2014 15:12:18 +0100
Subject: [Buildroot] [PATCH v2] package: standardise Apache licenses
In-Reply-To: <1388667708-6240-1-git-send-email-spdawson@gmail.com>
References: <1388667708-6240-1-git-send-email-spdawson@gmail.com>
Message-ID: <20140102151218.26ac81f7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear spdawson at gmail.com,

On Thu,  2 Jan 2014 13:01:48 +0000, spdawson at gmail.com wrote:
> From: Simon Dawson <spdawson@gmail.com>
> 
> Apache licenses are referred to in a variety of ways; standardise these,
> choosing a form which does not contain whitespace.
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  v2: Update license list in manual, suggested by Thomas De Schampheleire
> 
>  docs/manual/legal-notice.txt             | 3 +++
>  package/freerdp/freerdp.mk               | 2 +-
>  package/imagemagick/imagemagick.mk       | 2 +-
>  package/ne10/ne10.mk                     | 2 +-
>  package/python-msgpack/python-msgpack.mk | 2 +-
>  package/python-pyzmq/python-pyzmq.mk     | 2 +-
>  package/python-tornado/python-tornado.mk | 2 +-
>  package/subversion/subversion.mk         | 2 +-
>  package/thrift/thrift.mk                 | 2 +-
>  package/zxing/zxing.mk                   | 2 +-
>  10 files changed, 12 insertions(+), 9 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
