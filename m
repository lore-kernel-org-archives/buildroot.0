From: Thomas Lundquist <lists@zelow.no>
Date: Fri, 19 Jun 2009 12:12:49 +0200
Subject: [Buildroot] [Patch] OpenVZ tools
In-Reply-To: <1245097775.15517.30.camel@localhost.localdomain>
References: <1245097775.15517.30.camel@localhost.localdomain>
Message-ID: <20090619101249.GB9260@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 15, 2009 at 11:29:35PM +0300, Cristi Magherusan wrote:
> 
> By the way, wouldn't it be nicer to have a devlists.sh file which would
> contain "if" clauses in order to create devices according to the
> configuration, and the file could be executed to create the real devlist
> file. This way we could ensure the device needed by a tool is there, and
> missing when the tool is not compiled.

I'd rather have the devices needed contained either in the package 
makefile or a configuration file in the package directory.

if(defs) like you suggest would soon become a mess.


Thomas.
