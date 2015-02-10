From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 10 Feb 2015 21:10:13 +0100
Subject: [Buildroot] [PATCH 0/10 v7] NVidia GPU binary blobs for x86 and
 ARM (branch yem/gfx2)
In-Reply-To: <cover.1423597914.git.yann.morin.1998@free.fr>
References: <cover.1423597914.git.yann.morin.1998@free.fr>
Message-ID: <20150210201013.GA4497@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

On 2015-02-10 21:01 +0100, Yann E. MORIN spake thusly:
> This series adds support for NVidia's binary blob, the driver to its
> family of GPUs, for x86 (by Yann) and Tegra2 and Tegra3 (by Nicolas).
[--SNIP--]
> Yann E. MORIN (5):
>       package/python-lxml: new host package
[--SNIP--]
> Yegor Yefremov (1):
>       package/python-lxml: add target variant

One thing I forgot to say in the cover letter: python-lxml is no longer
required in this series, because we no longer install the Khronos
Registries.

However, since they were part of previous iterations of this series, and
some users seem to be wanting them, I kept them in the series.

What this means is: python-lxml (host and target variants) can be
applies without applying the NVidia packages patches, and conversely,
the NVidia patches can be applied without applying the python-lxml
patches (of course, barring any comment on either).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
