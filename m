From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 21:36:21 +0100
Subject: [Buildroot] [PATCH 1/1] uvw: disable CMake pthread test
In-Reply-To: <20191027203027.23297-1-asafka7@gmail.com>
References: <20191027203027.23297-1-asafka7@gmail.com>
Message-ID: <20191027213621.03d533aa@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 22:30:27 +0200
Asaf Kahlon <asafka7@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.net/results/9c61c06142c832a9669afdcafcbb8b1f7df51082
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/uvw/uvw.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
