From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 16:07:53 +0200
Subject: [Buildroot] [PATCH 1/1] protobuf: bump to version 3.0.0
In-Reply-To: <1476983609-17269-1-git-send-email-heyleke@gmail.com>
References: <1476983609-17269-1-git-send-email-heyleke@gmail.com>
Message-ID: <20161022160753.65f5e3d5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Oct 2016 19:13:29 +0200, Jan Heylen wrote:
> Signed-off-by: Jan Heylen <heyleke@gmail.com>
> ---
>  ...GLE_PROTOBUF_ATOMICOPS_ERROR-syntax-error.patch | 61 ----------------------
>  ...onfigure.ac-check-if-libatomic-is-needed.patch} |  4 +-
>  package/protobuf/protobuf.hash                     |  2 +-
>  package/protobuf/protobuf.mk                       |  2 +-
>  4 files changed, 4 insertions(+), 65 deletions(-)
>  delete mode 100644 package/protobuf/0001-Fix-GOOGLE_PROTOBUF_ATOMICOPS_ERROR-syntax-error.patch
>  rename package/protobuf/{0002-configure.ac-check-if-libatomic-is-needed.patch => 0001-configure.ac-check-if-libatomic-is-needed.patch} (85%)

I've applied, but you forgot to test building the python-protobuf
package, which uses the same source code. So I've fixed that up, and
also added a comment in protobuf.mk to remind people bumping this
package to also check python-protobuf.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
