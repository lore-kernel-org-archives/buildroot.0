From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 11:06:49 +0200
Subject: [Buildroot] [PATCH/RFC 1/1] package/qt: Avoid X11 header
 collision with OpenGL/EGL
In-Reply-To: <1465662619-9279-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465662619-9279-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20161016110649.4a92ed7b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Jun 2016 18:30:19 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> I am unsure whether this patch could break with other defconfigs,
> therefore I regard this patch as RFC.

Applied to master, after editing the commit log to add more details,
especially the autobuilder failures that this patch fixes.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
