From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Oct 2017 18:24:50 +0100
Subject: [Buildroot] [PATCH 2/2] package/boinc: add optional dependency
 to freetype
In-Reply-To: <59f6061c971dc_1ab03fe8a299247c4437d@ultri3.mail>
References: <20171029161256.18607-2-bernd.kuhls@t-online.de>
 <59f6061c971dc_1ab03fe8a299247c4437d@ultri3.mail>
Message-ID: <20171029182450.042f4c02@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Oct 2017 14:47:24 -0200, Ricardo Martincoski wrote:

> A nit related to the url: when the master branch changes (drastic
> examples: 100 lines are removed from the file, or even a configure
> option is added for freetype) this url would point to a wrong location.
> 
> A more future-proof url would be
> https://github.com/BOINC/boinc/blob/client_release/7.8/7.8.3/configure.ac#L497
> as we trust they won't change a tag.

Good point, I have used this URL when reworking Bernd's commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
