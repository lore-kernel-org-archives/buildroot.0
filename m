From: Stephan Hoffmann <sho@relinux.de>
Date: Sat, 19 Jan 2013 10:30:21 +0100
Subject: [Buildroot] [PATCH 1/1] Qt : bump version to latest 4.8.4
In-Reply-To: <871udozzd5.fsf@dell.be.48ers.dk>
References: <1358081260-14635-1-git-send-email-sagaert.johan@skynet.be>
 <871udozzd5.fsf@dell.be.48ers.dk>
Message-ID: <50FA67AD.3070506@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 13.01.2013 19:55, schrieb Peter Korsgaard:
>>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:
>  Sagaert> Qt : bump verson to latest release of QT 4
>  Sagaert> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
>
> Committed, thanks (with a tweaked commit message)
>
Hello,

this one seems to break autobuild on arm:

Status         : NOK
Failure reason : qt-4.8.4
Architecture   : arm
Submitted by   : Peter Korsgaard (gcc10)
Submitted at   : 2013-01-14 19:29:00
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=e4d89e7f2de5f2586223466a48d8eefba3b0f216
End of log     : http://autobuild.buildroot.net/results/90effdc27541b317fe216291e6db5f9b400bf9f4/build-end.log
Complete log   : http://autobuild.buildroot.net/results/90effdc27541b317fe216291e6db5f9b400bf9f4/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/90effdc27541b317fe216291e6db5f9b400bf9f4/config
Defconfig      : http://autobuild.buildroot.net/results/90effdc27541b317fe216291e6db5f9b400bf9f4/defconfig

Regards

Stephan
