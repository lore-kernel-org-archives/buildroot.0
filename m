From: Lloyd Sargent <lloyd@cannasoftware.com>
Date: Tue, 31 Mar 2009 12:16:26 -0500
Subject: [Buildroot] make rebuilds cross tools every time ?
In-Reply-To: <1238464652.5157.44.camel@localhost.localdomain>
References: <1238464652.5157.44.camel@localhost.localdomain>
Message-ID: <BDF5A472-B016-4916-BB20-8D0D3FDA748D@cannasoftware.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mar 30, 2009, at 8:57 PM, Jeff Steele wrote:

> Hi,
>
> I'm brand new to buildroot, and so far I'm very pleased with it.  One
> problem I've been having is that it seems to rebuild uClibc and the
> cross compiler/toolchain *every time* I type "make".
>
> For example, tar-1.18 failed to compile, so I edited tar.mk to bump  
> the
> version up to 1.20.  Then I did:
>
> # rm -rf tar-1.18
> # make
>
> Before I find out if the new version of tar compiles (it does,  
> BTW...),
> I have to wait for the whole toolchain to be rebuilt.
>
> Am I doing something wrong ?  Shouldn't the toolchain be independent  
> of
> target apps ?

I had it recompiling Linux everytime on one system and now, on this  
one, it recompiles DBUS.

Like you I'm new to buildroot and don't even know WHERE to start  
looking.

Cheers,

Lloyd
