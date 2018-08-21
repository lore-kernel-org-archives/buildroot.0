From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 17:35:56 +0200
Subject: [Buildroot] [PATCH v2 3/3] mariadb: bump version to 10.2.16
In-Reply-To: <d2ed2d47-33ae-1e39-5c66-b08d76913860@gmail.com>
References: <20180726163703.7598-1-bluemrp9@gmail.com>
 <20180726163703.7598-3-bluemrp9@gmail.com>
 <20180816232250.0e02d5fc@windsurf>
 <d2ed2d47-33ae-1e39-5c66-b08d76913860@gmail.com>
Message-ID: <20180821173556.7e6f7049@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Aug 2018 06:59:51 -0700, Ryan Coe wrote:

> I have another patch ready.? I disabled building RocksDB to get rid of 
> the build error that was encountered.? Is that acceptable or should I 
> work on something else?? Thanks.

I have no idea what RocksDB is. Google tells me: "RocksDB is an
embeddable persistent key-value store for fast storage". Is this a new
optional dependency of MariaDB ? According to
https://mariadb.org/wp-content/uploads/2017/11/shenzhen2017-myrocks-in-mariadb.pdf
it seems to be new in 10.2.

So yes, this is a new thing, you can keep it disabled until someone
else is interested enough to enable/fix it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
