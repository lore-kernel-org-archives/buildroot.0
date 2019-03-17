From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 11:56:32 +0100
Subject: [Buildroot] [PATCH 1/1] uftp: new package
In-Reply-To: <20190316070520.10174-1-asafka7@gmail.com>
References: <20190316070520.10174-1-asafka7@gmail.com>
Message-ID: <20190317115632.5c8a9481@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 16 Mar 2019 09:05:20 +0200
Asaf Kahlon <asafka7@gmail.com> wrote:

> Encrypted UDP based FTP with multicast.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  DEVELOPERS             |  1 +
>  package/Config.in      |  1 +
>  package/uftp/Config.in |  7 +++++++
>  package/uftp/uftp.hash |  3 +++
>  package/uftp/uftp.mk   | 21 +++++++++++++++++++++
>  5 files changed, 33 insertions(+)
>  create mode 100644 package/uftp/Config.in
>  create mode 100644 package/uftp/uftp.hash
>  create mode 100644 package/uftp/uftp.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
