From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jan 2011 18:12:54 +0100
Subject: [Buildroot] [PATCH 1/2] liberation: add support for custom
 target directory
In-Reply-To: <LF0UP9$6C050B5F0CF790CC5FFC45AB98AF886D@aruba.it>
References: <20110114094756.4f6d1747@surf>
	<LF0UP9$6C050B5F0CF790CC5FFC45AB98AF886D@aruba.it>
Message-ID: <20110114181254.3e773a18@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Jan 2011 17:48:45 +0100
"Luca Ceresoli" <list@lucaceresoli.net> wrote:

> > That could be one solution. The other solution would be to hide this
> > from the user, i.e an unvisible configuration option to select the
> > installation location of the fonts (i.e ? fonts in subdirs ? or ? all
> > fonts in /usr/share/fonts ?). ? fonts in subdirs ? would be the
> > default, and ? all fonts in /usr/share/fonts/ ? would be selected by
> > Nano-X/Microwindows. This way, the user wouldn't have to worry about
> > the installation location of fonts.
> 
> That would not be enough in my case.
> I don't use Nano-x/Microwin, my setup is based on qt + directfb + freetype.
> I am not sure which of these components needs fonts in a specific dir,
> but if fonts are in subdirs they won't be found.

Sorry, but I do not understand why it wouldn't be enough. If you need
all the fonts in a single directory, you would just select the ? all
fonts in /usr/share/fonts ? case, and that would work, no ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
