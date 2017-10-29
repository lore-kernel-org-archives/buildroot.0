From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 29 Oct 2017 14:47:24 -0200
Subject: [Buildroot] [PATCH 2/2] package/boinc: add optional dependency
 to freetype
References: <20171029161256.18607-2-bernd.kuhls@t-online.de>
Message-ID: <59f6061c971dc_1ab03fe8a299247c4437d@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Oct 29, 2017 at 02:12 PM, Bernd Kuhls wrote:

> No configure option present:
> https://github.com/BOINC/boinc/blob/master/configure.ac#L497

A nit related to the url: when the master branch changes (drastic
examples: 100 lines are removed from the file, or even a configure
option is added for freetype) this url would point to a wrong location.

A more future-proof url would be
https://github.com/BOINC/boinc/blob/client_release/7.8/7.8.3/configure.ac#L497
as we trust they won't change a tag.

Of course there is the super-safe url:
https://github.com/BOINC/boinc/blob/efcd3928571992b30144db84b43af7470d8b2d6a/configure.ac#L497

Regards,
Ricardo
