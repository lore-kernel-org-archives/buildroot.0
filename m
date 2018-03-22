From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Thu, 22 Mar 2018 09:35:13 +0100
Subject: [Buildroot] [PATCH v2 2/8] gst-plugins-{base, good, bad,
 ugly}: bump to 1.14
In-Reply-To: <20180321134120.498-2-aduskett@gmail.com>
References: <20180321134120.498-1-aduskett@gmail.com>
 <20180321134120.498-2-aduskett@gmail.com>
Message-ID: <45dd2108-7ad1-14ba-def9-dcf237f46d4b@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-03-21 14:41, Adam Duskett wrote:
> These are grouped together because several plugins have been re-arranged and
> there is no way to individually update each plugin package.
> 
> Changes:
> 
> Add the following to gst1-plugins-base and remove them from plugins-bad:
>  - opengl
>  - gles2
>  - glx
>  - egl
>  - x11
>  - wayland
>  - dispmanx
>  - audiomixer
> 
> Add the following to plugins-good and remove them from plugins-ugly:
>  - lame
>  - mpg123
> 
> Also add hashes for the license files.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - moved --disable-qt from plugins-bad to plugins-good (martin)

Shouldn't that be in the commit message list too? Even if we disable it
for now.

Other than that:
Acked-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
