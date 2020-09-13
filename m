From: Christian Stewart <christian@paral.in>
Date: Sat, 12 Sep 2020 17:37:19 -0700
Subject: [Buildroot] [PATCH v2 1/1] package/rtl8821au: fix build against
 5.8.x kernel
In-Reply-To: <20200912235432.224650-1-christian@paral.in>
References: <20200912235432.224650-1-christian@paral.in>
Message-ID: <CA+h8R2roHcVdygGh3xAZTrYn12tzKcqRQzXnbCY29kV0cghOjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Sat, Sep 12, 2020 at 4:54 PM Christian Stewart <christian@paral.in> wrote:
>
> Signed-off-by: Christian Stewart <christian@paral.in>
>
> ---
>
> v1 -> v2:
>
>  - added patch by @lwfinger to disable rtw_mgmt_frame_register
>  - wrote patch for change to proc_ops in 5.6.x from file_operations
>
> Signed-off-by: Christian Stewart <christian@paral.in>

Apologies, this is a duplicate patch submission (already updated patchwork).

Best,
Christian
