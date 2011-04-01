From: Patryk Benderz <Patryk.Benderz@esp.pl>
Date: Fri, 01 Apr 2011 15:20:43 +0200
Subject: [Buildroot] [xdriver_xf86-video-openchrome-0.2.904]
 via_video.c: error: 'struct _Pixmap' has no member named 'screen_x'
In-Reply-To: <1301422474.6206.37.camel@esp-patben-lin.espdx1.local>
References: <1301422474.6206.37.camel@esp-patben-lin.espdx1.local>
Message-ID: <1301664043.18237.38.camel@esp-patben-lin.espdx1.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[cut]
> Now make complains about:
> via_video.c: In function 'viaPaintColorkey':
> via_video.c:738:44: error: 'struct _Pixmap' has no member named 'screen_x'
> via_video.c:738:62: error: 'struct _Pixmap' has no member named 'screen_y'
> make[4]: *** [via_video.lo] Error 1
seems that snapshot from 2011-03-30 compiles openchrome correctly :)

-- 
Patryk "LeadMan" Benderz
Linux Registered User #377521
()  ascii ribbon campaign - against html e-mail 
/\  www.asciiribbon.org   - against proprietary attachments
