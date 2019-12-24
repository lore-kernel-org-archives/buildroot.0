From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 14:44:46 +0100
Subject: [Buildroot] [PATCH/next 1/2] package/protobuf and
 package/python-protobuf: bump to version 3.11.0
In-Reply-To: <20191128230158.948387-1-aduskett@gmail.com>
References: <20191128230158.948387-1-aduskett@gmail.com>
Message-ID: <20191224144446.18c909a6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 28 Nov 2019 15:01:57 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Tested with test-pkg, all tests passed:
>             br-arm-full [1/6]: OK
>  br-arm-cortex-a9-glibc [2/6]: OK
>   br-arm-cortex-m4-full [3/6]: SKIPPED
>          br-x86-64-musl [4/6]: OK
>      br-arm-full-static [5/6]: SKIPPED
>            sourcery-arm [6/6]: OK
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/protobuf/protobuf.hash               | 2 +-
>  package/protobuf/protobuf.mk                 | 2 +-
>  package/python-protobuf/python-protobuf.hash | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
