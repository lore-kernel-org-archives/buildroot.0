From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 15 Oct 2012 11:45:35 +0200
Subject: [Buildroot] [PATCH 07/10] pulseaudio: remove dependency on
	gettext
In-Reply-To: <20121014211044.17845.81591.stgit@localhost>
References: <20121014210734.17845.64519.stgit@localhost>
 <20121014211044.17845.81591.stgit@localhost>
Message-ID: <CAHXCMMKdoc9iq6Agnf13MkM+-Pq+7x_UgEQZxoKzb5L=6wHMfQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, all,

2012/10/14 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>:
> The dependency on gettext is only due to libglib2, not due to
> portaudio itself.  It works fine without gettext if libglib2 is
s/portaudio/pulseaudio/

> not selected.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Regards,

-- 
Sam
