From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 1 Oct 2019 02:52:49 +0300
Subject: [Buildroot] [PATCH v2 1/1] cmake: bump version to 3.15.3
In-Reply-To: <CADvTj4qO6FZYmjgP2GBLcrf7P-k14JCz2jVvcTrFT4B1Tt5dbQ@mail.gmail.com>
References: <20190929115731.128904-1-james.hilliard1@gmail.com>
 <20190930233542.6a084b17@windsurf.home>
 <CADvTj4qO6FZYmjgP2GBLcrf7P-k14JCz2jVvcTrFT4B1Tt5dbQ@mail.gmail.com>
Message-ID: <20191001025249.GB13164@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 1 Oct 2019 00:38:47 +0200, James Hilliard <james.hilliard1@gmail.com> wrote:
> On Mon, Sep 30, 2019, 11:35 PM Thomas Petazzoni <
> thomas.petazzoni at bootlin.com> wrote:
> 
> > Hello James,
> >
> > On Sun, 29 Sep 2019 05:57:31 -0600
> > James Hilliard <james.hilliard1@gmail.com> wrote:
> >
> > > Remove FindLibUV patch which is now upstream.
> > >
> > > Resync/reformat rename cmake rootfile patch for 3.15.3 with git format-patch.
> > >
> > > Set cmake version min to 3.10.
> >
> > What is the reasoning for changing the minimal CMake version to 3.10 ?
> >
> It's the minimum required by wpewebkit.

CMake 3.10 is also needed by webkitgtk 2.26.x

We don't often bump build dependencies in WebKit [1], but this happens to
be one of these occasions (and now that we have been able to, we would be
able to use some new features at last!).

=)

---
[1] https://trac.webkit.org/wiki/WebKitGTK/DependenciesPolicy
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191001/d7288b48/attachment.asc>
