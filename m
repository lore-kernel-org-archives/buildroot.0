From: Cristi Magherusan <Cristi.Magherusan@net.utcluj.ro>
Date: Thu, 02 Jul 2009 16:18:21 +0300
Subject: [Buildroot] [Patch] OpenVZ tools
In-Reply-To: <20090619101249.GB9260@zelow.no>
References: <1245097775.15517.30.camel@localhost.localdomain>
	<20090619101249.GB9260@zelow.no>
Message-ID: <1246540701.31666.106.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2009-06-19 at 12:12 +0200, Thomas Lundquist wrote:
> On Mon, Jun 15, 2009 at 11:29:35PM +0300, Cristi Magherusan wrote:
> > 
> > By the way, wouldn't it be nicer to have a devlists.sh file which would
> > contain "if" clauses in order to create devices according to the
> > configuration, and the file could be executed to create the real devlist
> > file. This way we could ensure the device needed by a tool is there, and
> > missing when the tool is not compiled.
> 
> I'd rather have the devices needed contained either in the package 
> makefile or a configuration file in the package directory.
> 
> if(defs) like you suggest would soon become a mess.
I admit this.

Then we could enhance the build system so that the package directories
contain devlist.txt files that may be used along with the main device
list file.

Is this acceptable?

Regards,
Cristi
-- 
Ing. Cristi M?gheru?an, System/Network Engineer
Technical University of Cluj-Napoca, Romania
http://cc.utcluj.ro  +40264 401247
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 197 bytes
Desc: This is a digitally signed message part
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090702/6d7482a3/attachment.pgp>
