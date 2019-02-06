From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 6 Feb 2019 14:24:23 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/kodi: remove X11-based
 OpenGL ES support
In-Reply-To: <20180401130109.8006-1-bernd.kuhls@t-online.de>
References: <20180401130109.8006-1-bernd.kuhls@t-online.de>
Message-ID: <86e4837e-3f2f-3913-e410-e4c311186898@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/04/2018 15:01, Bernd Kuhls wrote:
> To prepare the bump to the next Kodi version 18.0-Leia we remove the
> current OpenGL ES support options. Kodi 18.0 will bring a major
> overhaul of the supported windowing platforms, x11-based gles support
> was removed, see upstream PR 12196.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Series applied to master, thanks.

 Regards,
 Arnout
