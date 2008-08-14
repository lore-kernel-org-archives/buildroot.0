From: Ormund Williams <ormundw@panix.com>
Date: Thu, 14 Aug 2008 11:37:19 -0400
Subject: [Buildroot] Autodetect architechture
In-Reply-To: <48A4484C.9020000@oddjob.se>
References: <48A4484C.9020000@oddjob.se>
Message-ID: <1218728239.5564.6.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2008-08-14 at 16:59 +0200, Mikael Sundberg wrote:
> Hi everyone, I?m new on this list and have a problem.
> 
> When I try to build with "fontconfig" enabled I get a configuration 
> error saying:
>  - "Cannot autodetect architecture while crosscompiling", bails out and 
> tells me to use the "--with-arch" option.
> In "package/fontconfig/fontconfig.mk" there a 
> "--with-arch=$(GNU_TARGET_NAME)" in the FONTCONFIG_CONF_OPT but it 
> doesn?t seem to be added when the configure script runs.
> 
> Any ideas? Need more info?
> 
I asked that same question a few days ago, here's the answer

On Mon, 2008-08-11 at 11:56 +1200, Matthew Dombroski wrote:
> theres a bug causing this-
> http://busybox.net/bugs/view.php?id=0004454
> 
> I don't know why it hasnt been fixed yet....
> revision 23038 of Makefile.autotools.in will work, or you could fix it
> in your local tree.
> 

__
Ormund
