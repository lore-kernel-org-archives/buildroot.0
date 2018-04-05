From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Apr 2018 10:08:02 +0200
Subject: [Buildroot] [PATCH v3 2/2] python-psycopg2: new package
In-Reply-To: <20180312101231.2280-2-aduskett@gmail.com>
References: <20180312101231.2280-1-aduskett@gmail.com>
 <20180312101231.2280-2-aduskett@gmail.com>
Message-ID: <20180405100802.205ba2fb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Mar 2018 06:12:31 -0400, Adam Duskett wrote:
> Psycopg is the most popular PostgreSQL database adapter for the Python
> programming language. Its main features are the complete implementation of the
> Python DB API 2.0 specification and the thread safety (several threads can
> share the same connection). It was designed for heavily multi-threaded
> applications that create and destroy lots of cursors and make a large number of
> concurrent INSERTs or UPDATEs.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - None

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
