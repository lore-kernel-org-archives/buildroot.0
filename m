From: Richard Braun <rbraun@sceen.net>
Date: Tue, 16 Oct 2012 19:13:51 +0200
Subject: [Buildroot] root login fails on vga console but works on ttyS0
In-Reply-To: <507D91E7.7080800@wanadoo.fr>
References: <507D91E7.7080800@wanadoo.fr>
Message-ID: <20121016171351.GA3171@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 16, 2012 at 06:57:11PM +0200, Thierry Bultel wrote:
> After some investigation I found out that "console" was not part of
> /etc/securetty
> Is this expected ?

Yes. The video (VGA/framebuffer) consoles are /dev/ttyX, /dev/tty1
being the main one.

-- 
Richard Braun
