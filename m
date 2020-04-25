From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 22:35:23 +0200
Subject: [Buildroot] [PATCH v1 1/1] package/proftpd: add mod_sftp_sql
In-Reply-To: <20200228194717.21758-1-jared.bents@rockwellcollins.com>
References: <20200228194717.21758-1-jared.bents@rockwellcollins.com>
Message-ID: <20200425223523.3056e9c6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 28 Feb 2020 13:47:17 -0600
Jared Bents <jared.bents@rockwellcollins.com> wrote:

> update to add mod_sftp_sql for proftpd as a build option
> http://www.proftpd.org/docs/contrib/mod_sftp_sql.html
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> ---
>  package/proftpd/Config.in  | 7 +++++++
>  package/proftpd/proftpd.mk | 4 ++++
>  2 files changed, 11 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
