From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 15:24:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/paho-mqtt-cpp: bump to version
 1.0.1
In-Reply-To: <1568023785-19574-1-git-send-email-refik.tuzakli@savronik.com.tr>
References: <1568023785-19574-1-git-send-email-refik.tuzakli@savronik.com.tr>
Message-ID: <20190915152400.7565fd0d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Refik,

On Mon, 9 Sep 2019 10:09:44 +0000
Refik TUZAKLI <refik.tuzakli@savronik.com.tr> wrote:

> Signed-off-by: Refik Tuzakli <refik.tuzakli@savronik.com.tr>
> ---
>  package/paho-mqtt-cpp/paho-mqtt-cpp.hash | 2 +-
>  package/paho-mqtt-cpp/paho-mqtt-cpp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/paho-mqtt-cpp/paho-mqtt-cpp.hash b/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
> index d4af11b..c77aa09 100644
> --- a/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
> +++ b/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
> @@ -1,4 +1,4 @@
>  # Locally computed:
> -sha256  9f78afb988e9ce9bb7cb74805053221efbb073b74683e222d1d087633178b51f  paho-mqtt-cpp-1.0.0.tar.gz
> +sha256  e97386d159b811e534b98d21e3f6881ab2b43678ec026da7525d5c21ebc292ff  paho-mqtt-cpp-v1.0.1.tar.gz

I don't know how you tested this, but the re-addition of the "v" in the
version made this package fail to build:

ERROR: No hash found for paho-mqtt-cpp-1.0.1.tar.gz

So I fixed up the .hash file, and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
