From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Tue, 1 Sep 2020 17:56:40 -0500
Subject: [Buildroot] Backport fix for systemd to 2020.02.x
Message-ID: <CA+fik51zZu=eWbpP-WGwAysVUef7nLDuFFW_fotsSy=OyFNzVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, on the master branch, commit  65b637 ("package/systemd: move preset-all
HOOK to fakeroot stage") fixes the systemd package so that the "systemctl
preset-all" runs after ROOFS_OVERLAY and POST_BUILD_SCRIPT, and picks up on
preset and service files installed by them. Could that commit be added to
2020.02.x as well?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200901/c8e4153d/attachment.html>
