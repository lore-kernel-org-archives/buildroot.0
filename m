From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Oct 2017 12:38:32 +0200
Subject: [Buildroot] [V3 3/3] prosody: tweak configuration
In-Reply-To: <20171022071716.792-3-francois.perrad@gadz.org>
References: <20171022071716.792-1-francois.perrad@gadz.org>
 <20171022071716.792-3-francois.perrad@gadz.org>
Message-ID: <20171022123832.00d3543b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,


> diff --git a/package/prosody/0001-enable-syslog.patch b/package/prosody/0001-enable-syslog.patch
> new file mode 100644
> index 000000000..af67f0f03
> --- /dev/null
> +++ b/package/prosody/0001-enable-syslog.patch
> @@ -0,0 +1,22 @@
> +enable syslog
> +
> +note: the posix module is auto-loaded by default
> +
> +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

It would be nicer to have Git formatted patches, you can use their Git
mirror at https://github.com/bjc/prosody.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
