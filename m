From: Jason Bodnar <jason@shakabuku.org>
Date: Thu, 29 Nov 2007 14:41:22 -0600
Subject: [Buildroot] Adding new software so it appears in menuconfig
In-Reply-To: <d6cda7730711291228s6d449650qc5737be259077e44@mail.gmail.com>
References: <20071129195432.M20637@shakabuku.org>
	<d6cda7730711291228s6d449650qc5737be259077e44@mail.gmail.com>
Message-ID: <20071129204107.M10295@shakabuku.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bingo! That was it. Thanks!

Jason

On Thu, 29 Nov 2007 18:28:41 -0200, Thiago A. Corr?a wrote
> Hi Jason,
> 
>     Check package/Config.in. If you have created your Config.in and
> package.mk, then you just need to include a new line in
> package/Config.in if I recall it correctly. :)
> 
> Regards.
> 
> On Nov 29, 2007 5:56 PM, Jason Bodnar <jason@shakabuku.org> wrote:
> > I've followed the documentation online for adding new software packages to
> > buildroot <http://buildroot.uclibc.org/buildroot.html#add_software>, but there
> > is no information about how to make the new package appear in the package
> > selection menu when running make menuconfig. How do I do that?
> >
> > --
> > Jason Bodnar
> > jason at shakabuku.org
> > http://www.shakabuku.org
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
> >


--
Jason Bodnar
jason at shakabuku.org
http://www.shakabuku.org
