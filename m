From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jan 2020 23:06:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-pyqt5: select
 BR2_PACKAGE_QT5BASE_GUI
In-Reply-To: <20191230234259.5bfe6355@windsurf>
References: <20191230214842.1485805-1-fontaine.fabrice@gmail.com>
 <20191230234259.5bfe6355@windsurf>
Message-ID: <20200112230647.1fce0393@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice,

Any comment on the below question ?

Thanks!

Thomas

On Mon, 30 Dec 2019 23:42:59 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Mon, 30 Dec 2019 22:48:42 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
> > gui is a mandatory dependency of python-pyqt5 as "-gui" option is used
> > internally by the configure.py script
> > 
> > Fixes:
> >  - http://autobuild.buildroot.org/results/ea0c8db44aacf1ce76f75e8288969fe5da6690d9
> > 
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>  
> 
> This seems weird. Are you sure? Could you talk with upstream about this?
> 
> Thomas



-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
