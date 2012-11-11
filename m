From: Simon Dawson <spdawson@gmail.com>
Date: Sun, 11 Nov 2012 22:47:23 +0000
Subject: [Buildroot] [PATCH 2/2 v3] neardal: new package
In-Reply-To: <50A02527.4020801@mind.be>
References: <1352628468-14490-1-git-send-email-spdawson@gmail.com>
 <1352628468-14490-3-git-send-email-spdawson@gmail.com>
 <50A02527.4020801@mind.be>
Message-ID: <CAHt8ZCPazPz34VYN5Vs35Znq13nhbep=Ay9k2SGpKF=PVy7BWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11 Nov 2012 22:22, "Arnout Vandecappelle" <arnout@mind.be> wrote:
>  Boy, looks like I wasn't paying attention...  You need to copy the
> dependencies from dbus-glib:
>         depends on BR2_PACKAGE_DBUS # dbus-glib
>         depends on BR2_USE_WCHAR # glib2
>
>  And of course a comment to explain its absence.

Okay; thanks Arnout.

Simon.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121111/0354e4d3/attachment-0001.html>
