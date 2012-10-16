From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Tue, 16 Oct 2012 18:57:11 +0200
Subject: [Buildroot] root login fails on vga console but works on ttyS0
Message-ID: <507D91E7.7080800@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi again,

I have root login work on ttyS0, but fails on the vga console.
I am even not asked for a pasword.

After some investigation I found out that "console" was not part of 
/etc/securetty
Is this expected ?

Thanks
Thierry


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121016/7df09dba/attachment.html>
