From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 25 Jun 2015 22:04:37 +0200
Subject: [Buildroot] [PATCH v6 00/16] OpenCV bump
In-Reply-To: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
References: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
Message-ID: <CAHXCMMK5L1t8pW50VdhfrCbPoqdSxnwAsLq7tsjmRc8qkc0U0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 25, 2015 at 9:59 PM, Samuel Martin <s.martin49@gmail.com> wrote:
>
> Hi all,
>
> Here is yet another iteration for the bump of OpenCV package, and
> related features/packages.
>
> Patches 1 cleans up the current opencv.mk file.
> Patch 2 does the actual bump.
> Patch 3 disables gst1-plugins-opencv.
> Patch 4 fixes a long-standing issue in the OpenCV integration.
> Patch 5 to 7 polish opencv menu.
> Patches 8 to 15 add/improve 3rd-party supports.
> Patches 16 fix reverse dependency (vlc).
>
> Note that, if merged, patch 7/16 can/will break defconfigs having opencv
> selected.
>
> This series has been run in a local autobuilder, triggering more build
> failures. A patch adding an exception for this series will be issued
> soon...

Here it is:
http://lists.busybox.net/pipermail/buildroot/2015-June/130854.html
http://patchwork.ozlabs.org/patch/488547/

Regards,
