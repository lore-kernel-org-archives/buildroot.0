From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 Mar 2008 22:33:26 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package: editors
	editors/vim
In-Reply-To: <20080306180815.1953E120159@busybox.net> (ninevoltz@uclibc.org's
	message of "Thu\, 6 Mar 2008 10\:08\:15 -0800 \(PST\)")
References: <20080306180815.1953E120159@busybox.net>
Message-ID: <877igffsgp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ninevoltz" == ninevoltz  <ninevoltz@uclibc.org> writes:

Hi,

 ninevoltz> Log:
 ninevoltz> added vim and editors directory

 ninevoltz> Added:
 ninevoltz>    trunk/buildroot/package/editors/
 ninevoltz>    trunk/buildroot/package/editors/Config.in
 ninevoltz>    trunk/buildroot/package/editors/editors.mk
 ninevoltz>    trunk/buildroot/package/editors/vim/
 ninevoltz>    trunk/buildroot/package/editors/vim/Config.in
 ninevoltz>    trunk/buildroot/package/editors/vim/configure.patch
 ninevoltz>    trunk/buildroot/package/editors/vim/patches
 ninevoltz>    trunk/buildroot/package/editors/vim/vim.mk

There's already a texteditors submenu under packages. Please merge vim
with that (and probably move nano+uemacs under editors/).

-- 
Bye, Peter Korsgaard
