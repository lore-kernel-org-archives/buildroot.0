From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Jul 2018 15:20:40 +0200
Subject: [Buildroot] [PATCH v2 2/3] mariadb: needs dynamic library
 support
In-Reply-To: <20180726163703.7598-2-bluemrp9@gmail.com>
References: <20180726163703.7598-1-bluemrp9@gmail.com>
 <20180726163703.7598-2-bluemrp9@gmail.com>
Message-ID: <20180729152040.08ef2756@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ryan,

On Thu, 26 Jul 2018 09:37:02 -0700, Ryan Coe wrote:
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> ---
>  package/mysql/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

An empty commit log for this kind of change is really not good. How did
you realize it needs dynamic library support ? Why there is no
autobuilder failure ? How does it fail to build ?

I've improved the commit log and applied, but for future patches, it
would really be nice to have more detailed commit logs.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
