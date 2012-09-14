From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Fri, 14 Sep 2012 06:26:04 -0400
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2012-09-13
Message-ID: <CADiAo4LU1ysmNjJktsSsA3zqRnRTQ6_t4KJM4QzEWRFM7K5eTQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

Status         : NOK
Failure reason : linux-pam-1.1.4
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-09-13 14:55:33
Git commit ID  :
http://git.buildroot.net/buildroot/commit/?id=d7f8dda7c07dd5eaddc1f0e2fa4d7426e673f8ac
End of log     :
http://autobuild.buildroot.net/results/03c64cf7006dbc510dcb7bb153b32a840c43c37f/build-end.log
Complete log   :
http://autobuild.buildroot.net/results/03c64cf7006dbc510dcb7bb153b32a840c43c37f/build.log.bz2
Configuration  :
http://autobuild.buildroot.net/results/03c64cf7006dbc510dcb7bb153b32a840c43c37f/config
Defconfig      :
http://autobuild.buildroot.net/results/03c64cf7006dbc510dcb7bb153b32a840c43c37f/defconfig

I posted a patch (must fix on all arches), but it likely got lost in space:

http://lists.busybox.net/pipermail/buildroot/2012-September/058529.html
(dated Wed Sep 12 09:27:31 UTC 2012)  - please apply.

This is a temporary measure to make linux-pam build without
pam_userdb; I was told that gdbm will soon be added; then I can
implement the database choice logic from

http://lists.busybox.net/pipermail/buildroot/2012-September/058494.html

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
