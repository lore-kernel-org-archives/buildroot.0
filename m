From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Jul 2017 00:00:45 +0200
Subject: [Buildroot] [PATCH 1/1] sqlite: add json1 support
In-Reply-To: <20170626161744.11355-1-bradford.barr@gmail.com>
References: <20170626161744.11355-1-bradford.barr@gmail.com>
Message-ID: <20170703000045.2c2cbfd1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Jun 2017 09:17:44 -0700, bradford barr wrote:
> From: bradford barr <bradford@density.io>
> 
> Add support for the JSON1 SQLite extensions. This extension allows SQLite to
> store and query JSON objects in a database.
> 
> Signed-off-by: bradford barr <bradford.barr@gmail.com>
> Signed-off-by: bradford barr <bradford@density.io>
> ---
>  package/sqlite/Config.in | 6 ++++++
>  package/sqlite/sqlite.mk | 4 ++++
>  2 files changed, 10 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
