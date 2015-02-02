From: Lionel Orry <lionel.orry@gmail.com>
Date: Mon, 2 Feb 2015 15:05:06 +0100
Subject: [Buildroot] board-specific autotools env customization
Message-ID: <CAKAx1chT6Grx+oRMiQy5t29TUe=avo6v9CR2nP1GZ6Lf1-a-5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I would like to use a specific XXX_CONF_ENV variable to send ac_cv_...
variables to configure, but they are specific to my compiler. For my tests,
I currently write the XXX_CONF_ENV directly into the package .mk file, but
I would like to know if there is a better way. I already use the
recommended board/<company>/<board>/patches/ infrastructure, but this is
not a patch so I don't know where to put it...

Any advice / best practice ?

Thank you very much,
Lionel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150202/c22a2f5d/attachment.html>
