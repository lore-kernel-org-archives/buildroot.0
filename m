From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jul 2016 17:50:12 +0200
Subject: [Buildroot] [PATCH 1/1] Allow imagemagick to find ghostscript
	fonts.
In-Reply-To: <1434420746-20199-1-git-send-email-grepper@gmail.com>
References: <1434420746-20199-1-git-send-email-grepper@gmail.com>
Message-ID: <CACXmViZNZ9QGrGrefE=o7MCkS__Fg7dLbL7sMXx+LucwLz4CpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 16, 2015 at 4:12 AM, grepper <grepper@gmail.com> wrote:

Sorry for the slow response!

> It appears that Imagemagick needs to be configured with
>  --with-gs-font-dir=/usr/share/fonts/gs else it will not find
> the ghostscript fonts and /etc/ImageMagick-6/type-ghostscript.xml
> will contain the wrong font paths. You end up with messages like:
> Magick: unable to read font `(null)' @ error/annotate.c/RenderFreetype/1153
> They are non-fatal but could get annoying fast if you are using 'convert'
> on a lot of files.
>
> Signed-off-by: Robert Sohn <grepper@gmail.com>

Committed after extending the commit message, thanks!

--
Bye, Peter Korsgaard
