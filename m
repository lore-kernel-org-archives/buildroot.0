From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Sep 2019 19:35:55 +0200
Subject: [Buildroot] [PATCH 1/2] syslog-ng: update version in config file
In-Reply-To: <20190909095432.3935-1-judge.packham@gmail.com>
References: <20190909095432.3935-1-judge.packham@gmail.com>
Message-ID: <20190910193555.3b18acff@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  9 Sep 2019 21:54:31 +1200
Chris Packham <judge.packham@gmail.com> wrote:

> syslog-ng warns when using a configuration from an older version. Update
> the version in the example config.
> 
> Fixes: 9695f3e069 ("package/syslog-ng: bump version to 3.22.1")
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>  package/syslog-ng/syslog-ng.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
