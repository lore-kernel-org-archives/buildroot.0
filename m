From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 21:41:04 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain-external: improve musl
 external check
In-Reply-To: <1489989370-22377-1-git-send-email-ilya.kuzmich@gmail.com>
References: <1489989370-22377-1-git-send-email-ilya.kuzmich@gmail.com>
Message-ID: <20170326214104.68285bca@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Mar 2017 08:56:10 +0300, Ilya Kuzmich wrote:
> Test whether musl used or not: compile minimal C program and check if
> interpreter contains /lib/ld-musl.
> 
> Signed-off-by: Ilya Kuzmich <ilya.kuzmich@gmail.com>
> ---
>  toolchain/helpers.mk                                   | 13 +++++++++----
>  toolchain/toolchain-external/pkg-toolchain-external.mk |  4 +++-
>  2 files changed, 12 insertions(+), 5 deletions(-)

Applied to master, thanks. However, I had to make a preliminary fix
because TOOLCHAIN_EXTERNAL_READELF had a wrong value when Buildroot
external toolchains were used.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
