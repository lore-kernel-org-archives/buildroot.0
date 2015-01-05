From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jan 2015 17:55:53 +0100
Subject: [Buildroot] [PATCH v2] python-tornado: bump to 4.0.2
In-Reply-To: <1420473787-13585-1-git-send-email-yegorslists@googlemail.com>
References: <1420473787-13585-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20150105175553.740dff14@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Mon,  5 Jan 2015 17:03:07 +0100, Yegor Yefremov wrote:

> diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
> new file mode 100644
> index 0000000..d5304fe
> --- /dev/null
> +++ b/package/python-tornado/python-tornado.hash
> @@ -0,0 +1,2 @@
> +sha1    6152ea61b4cdf9566f3974f30603ff51b527dd87                          tornado-4.0.2.tar.gz
> +sha256  900c5124ebdb6598ca8e8a0c5888f41a5f14117952d5515258e3d20222b21bfa  tornado-4.0.2.tar.gz

Where are those hashes coming from? There should be a first line with a
comment saying where the hashes come from (either the URL, or if they
were only calculated by you, something like "Locally calculated").

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
