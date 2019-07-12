From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 12 Jul 2019 15:46:23 +0200
Subject: [Buildroot] [PATCH buildroot-test v2 3/4] web/schema.sql: add
 indexes on the database schema
In-Reply-To: <20190708081707.28348-4-victor.huesca@bootlin.com>
References: <20190621123712.8060-1-victor.huesca@bootlin.com>
 <20190708081707.28348-1-victor.huesca@bootlin.com>
 <20190708081707.28348-4-victor.huesca@bootlin.com>
Message-ID: <20190712154623.0275b684@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Victor,

On Mon,  8 Jul 2019 10:17:06 +0200
Victor Huesca <victor.huesca@bootlin.com> wrote:

> Add indexes on the two columns of `symbol_per_result` to improve significantly
> queries involving symbols (this is an over 80M rows table).
> This table is heavily used to retrieve results matching a symbols and it is not
> an option filter symbols without these indexes.
> 
> Also mark these same columns as foreign keys to ensure integrity of the
> database.
> 
> Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>

Thanks, I've applied to buildroot-test with a slightly improved commit
log:

  https://git.buildroot.org/buildroot-test/commit/?id=d40fe4f389a60569e2369cb69f1703f7d8b1c6a3

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
