From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 6 Feb 2018 21:54:56 +0100
Subject: [Buildroot] [PATCH v1] libv4l: fix EVIOCSCLOCKID related
 compile failure
In-Reply-To: <20180205225021.58239ef2@windsurf>
References: <20180203221141.15490-1-ps.report@gmx.net>
 <20180205225021.58239ef2@windsurf>
Message-ID: <20180206215456.0c63f465@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 5 Feb 2018 22:50:21 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> On Sat,  3 Feb 2018 23:11:41 +0100, Peter Seiderer wrote:
> > Fixes [1]:
> > 
> >   keytable.c: In function 'test_event':
> >   keytable.c:1351:12: error: 'EVIOCSCLOCKID' undeclared (first use in this function)
> >     ioctl(fd, EVIOCSCLOCKID, &mode);
> > 
> > [1] http://autobuild.buildroot.net/results/8ba380471423bd2491e40103d7b1a45de1bd12ed
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  ...fix-EVIOCSCLOCKID-related-compile-failure.patch | 35 ++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644 package/libv4l/0002-keytable-fix-EVIOCSCLOCKID-related-compile-failure.patch  
> 
> Applied to master, thanks.

And upstream submitted, see [2]...

Regards,
Peter

[2] https://www.spinics.net/lists/linux-media/msg128533.html

> 
> Thomas
