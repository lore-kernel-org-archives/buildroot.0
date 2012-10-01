From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Mon, 1 Oct 2012 03:54:32 -0700 (PDT)
Subject: [Buildroot] long starting time
Message-ID: <1349088872.23403.YahooMailNeo@web164601.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I don't know if this question should be targeted to Buildroot forum.
My root file system (X framebuffer)?was built using Buildroot and my 
.xinitrc file consists of these lines:
?
twm &
xclock -geometry 100x100-1+1 & 
/root/MyProgram &
exec xterm -geometry 30x36+0+0 - name login
?
Few strange matters I noticed. When starting X (framebuffer) server, it
correctly read those lines and start xterm (few seconds later) and after
that, I had to wait about 20 seconds for other two programs to start.
I don't know why this happens. 
Also, program, named MyProgram (only one window and button inside), when 
started, draws only window's border and when I click on caption it then 
repaints window and do corectly whatever intended programatically. 
And last, can I somehow avoid twm or use some other window manager, because
I would like not to have twm's menues (when clicked on empty space of
desktop).
?
Regards
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121001/f8288dd0/attachment-0001.html>
