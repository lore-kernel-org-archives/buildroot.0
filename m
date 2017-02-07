From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 7 Feb 2017 15:32:32 +0100
Subject: [Buildroot] [PATCH v5 01/19] reproducible: fix DATE/TIME macros
 in toolchain-wrapper
In-Reply-To: <1482241596-31688-2-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-2-git-send-email-jezz@sysmic.org>
Message-ID: <CAHXCMMKrS8kad54BS4N09pz-WqUfr48yYh5jo59BXATLGLDSow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?r?me, all,

On Tue, Dec 20, 2016 at 2:46 PM, J?r?me Pouiller <jezz@sysmic.org> wrote:
> The use __DATE__ and __TIME__ are one of most common sources of
> non-reproducible binaries. In order to fix that, gcc begin to support
> SOURCE_DATE_EPOCH variable. This patch take advantage of toolchain-wrapper
> to provide support of SOURCE_DATE_EPOCH to older gcc versions.
>
> Function get_source_date_epoch() come directly from gcc git.
>
> This work was sponsored by `BA Robotic Systems'.
>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,


-- 
Samuel
