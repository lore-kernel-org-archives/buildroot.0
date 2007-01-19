From: Thilo Riessner <thilo@riessner.de>
Date: Fri, 19 Jan 2007 16:12:09 +0100
Subject: [Buildroot] chown to root does not work
In-Reply-To: <20070119133516.GI14371@priv.blacknet.de>
References: <200701191331.07579.thilo@riessner.de>
	<20070119133516.GI14371@priv.blacknet.de>
Message-ID: <200701191612.12016.thilo@riessner.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Freitag, 19. Januar 2007 14:35 schrieb Goetz Bock:
> On Fri, Jan 19 '07 at 13:31, Thilo Riessner wrote:
> > In the docs is mentioned, that one doesn't need to be root to build a
> > root filesystem. But when building the filesystem as a normal user, chown
> > is not able to change owner to root in the target filesystem. Is there a
> > solution of the problem, that I don't see?
>
> Use fakeroot. Than the cpio/tar/... root images are owned by root.
I don't know fakeroot. What is it? A programme, an option of buildroot? How do 
I have to use it?
Thanks for your help so far.
Thilo
