From: Arnar Mar Sig <antab@valka.is>
Date: Fri, 7 Mar 2008 04:43:17 +0000
Subject: [Buildroot] svn commit: trunk/buildroot/package:
	editors	editors/vi
Message-ID: <ADB1372A-7CAA-41A5-A619-09A9DF0A0D0D@valka.is>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: Hamish Moffatt <hamish@cloud.net.au>
> Date: March 6, 2008 11:54:55 PM GMT+00:00
> To: buildroot at uclibc.org
> Subject: Re: [Buildroot] svn commit: trunk/buildroot/package:  
> editors	editors/vim
>>
>> Added:
>>  trunk/buildroot/package/editors/
>
> Why add hierarchy into the package directory?
>
It's getting a little crowded in the package/ directory so i added  
this subdirectory

> From: Peter Korsgaard <jacmet@uclibc.org>
> Date: March 6, 2008 9:33:26 PM GMT+00:00
> To: buildroot at uclibc.org
> Subject: Re: [Buildroot] svn commit: trunk/buildroot/package:  
> editors editors/vim
>
> There's already a texteditors submenu under packages. Please merge vim
> with that (and probably move nano+uemacs under editors/).

Didin't see any editors submenu when i added the package, i was going  
to move the other editor packages under editors/ and move the  
Config.in includes from packages/Config.in, or are you people against  
this move?


Arnar Mar Sig
