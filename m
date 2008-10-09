From: Ormund Williams <ormundw@panix.com>
Date: Thu, 09 Oct 2008 08:42:22 -0400
Subject: [Buildroot] svn commit: trunk/buildroot/package/directfb
In-Reply-To: <d6cda7730810082221w6019c604occa5158abac583f2@mail.gmail.com>
References: <20081007202927.B2E04F802A@busybox.net>
	<1223515552.3276.52.camel@localhost.localdomain>
	<d6cda7730810082221w6019c604occa5158abac583f2@mail.gmail.com>
Message-ID: <1223556143.3276.82.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2008-10-09 at 02:21 -0300, Thiago A. Corr?a wrote:
> I have no idea what directfb-csource is.
It's a utility for converting a PNG file to a c source file.  The source
code for it is in the DirectFB source itself.

> This just works for me when compiling for AVR32.
> 
> I also don't have it on my search path either:
> localhost directfb # which directfb-csource
> which: no directfb-csource in
> (/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin:/usr/i686-pc-linux-gnu/gcc-bin/4.1.2:/usr/kde/4.0/sbin:/usr/kde/4.0/bin)
> 
> So It can't be coming from the host. Did it work at all before?
> Perhaps it's one of the new options?
> 
I'm using a make file I hacked together based on one Peter Korsgaard
posted to the list some time ago.  Under this make file it's built and
has the target prefix attached, i686-linux-directfb-csource under
the ../staging_dir/usr/bin

This is puzzling.

Regards

__
Ormund
