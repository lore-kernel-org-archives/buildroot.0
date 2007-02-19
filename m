From: Philippe Ney <philippe.ney@pardes.ws>
Date: Mon, 19 Feb 2007 08:54:14 +0100
Subject: [Buildroot] which make target?
In-Reply-To: <loom.20070219T020427-332@post.gmane.org>
References: <loom.20070219T020427-332@post.gmane.org>
Message-ID: <20070219085414.1a5072ed.philippe.ney@pardes.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi,
> 
> If I edit skel.tar.gz, is there a make target I can specify instead of doing 
> a 'make clean' then 'make' eg. something like 'make skel'?
> 
> Cheers,
> Daniel

Hi,

# rm -rf $(BUILD_DIR)/root
# make

Should do the trick.

Philippe
