From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Dec 2017 16:11:19 +0100
Subject: [Buildroot] [PATCH] omxplayer: bump to version 2ee17b2
In-Reply-To: <20171201224058.2a3eebca@windsurf.lan>
References: <20171201172755.9968-1-julius@kriukas.lt>
 <20171201224058.2a3eebca@windsurf.lan>
Message-ID: <20171203151119.GA2765@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julius, All,

On 2017-12-01 22:40 +0100, Thomas Petazzoni spake thusly:
> Hello,
> 
> On Fri,  1 Dec 2017 19:27:55 +0200, Julius Kriukas wrote:
> > This patch updates omxplayer package to the latest commit on master as
> > of 2017-12-01.
[--SNIP--]
> Applied to master, thanks.

This is causing some build failures, probably because of a missing
dependency on alsa-lib:

    http://autobuild.buildroot.org/results/652/65212c59a37398681b341263bd76ba8a65ff7828/

    linux/OMXAlsa.cpp:21:28: fatal error: alsa/asoundlib.h: No such file
    or directory
     #include <alsa/asoundlib.h>
                            ^
    compilation terminated.

Can you have a look, please?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
