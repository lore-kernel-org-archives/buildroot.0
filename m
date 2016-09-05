From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 05 Sep 2016 13:05:41 +0200
Subject: [Buildroot] [PATCH] lxc: revive "drop-werror" patch
In-Reply-To: <20160903205335.4b1376ca@free-electrons.com>
References: <1472916289-3927-1-git-send-email-jezz@sysmic.org>
 <20160903205335.4b1376ca@free-electrons.com>
Message-ID: <1524184.lBqcmrBiar@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Saturday 03 September 2016 20:53:35 Thomas Petazzoni wrote:
> On Sat,  3 Sep 2016 17:24:49 +0200, J?r?me Pouiller wrote:
> > commit 5050a94ae9f448641e05ce29c931671ffdc62784 dropped patch that
> > remove '-Werror' from CFLAGS. However, it seems this patch is still
> > necessary:
> >   http://autobuild.buildroot.net/results/b1cbca6d0396863654b1d09ccc3
> >   163c5f6124ab8
> >   http://autobuild.buildroot.net/results/fcf2834ad74b95548d25dad227
> >   4704ea401f9665
> >   http://autobuild.buildroot.net/results/048be2fc702c9dba9ca4439ff6
> >   87d71b30c10551
> >   http://autobuild.buildroot.net/results/939246c9a4f433dfd0dc414988
> >   f5957441b8e9b4> 
> > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> > ---
> > 
> >  package/lxc/0001-drop-werror.patch | 16 ++++++++++++++++
> >  package/lxc/lxc.mk                 |  2 ++
> >  2 files changed, 18 insertions(+)
> >  create mode 100644 package/lxc/0001-drop-werror.patch
> 
> Applied to master, thanks. However, could you submit upstream that can
> be accepted? For example, something that adds a --disable-werror
> option.

Unfortunately, it was rejected: https://github.com/lxc/lxc/pull/1168. I 
have never been a good advocate.


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
