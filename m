From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 28 Nov 2011 08:59:18 +0100
Subject: [Buildroot] MySQL Server Package, help needed
In-Reply-To: <CAOrUntZRB7JSVt+WFn3bOfQd9WiYfN-qx9c0iRsO_cZ+qObYSw@mail.gmail.com>
References: <CAOrUntZRB7JSVt+WFn3bOfQd9WiYfN-qx9c0iRsO_cZ+qObYSw@mail.gmail.com>
Message-ID: <CAAXf6LUsAz19qfcmuga0pvdSuUWog=p7XMM_+Cxg408HhneDig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ben,

On Sat, Nov 26, 2011 at 10:46 AM, Andrea Benini <andreabenini@gmail.com> wrote:
> Hi Guys,
> I've used buildroot and uclibc for a while and I'm now stucked with a
> package I'd like to build.
> Target Architecture: i386, variant: i686. Buildroot 2011.08 stable
> I'd like to add MySQL to the package list, I'd like to have a MySQL daemon
> installed (mysqld), not just the client interface.
> MySQL Server is not yet supported due to cross compiling issues I suppose.
> I was wondering if someone else has?a ready made package for MySQL, I've
> tried several solutions grabbed all around after a lot of google searches
> (from: Voltz,?Zuerker, fork on googlecode, and few tips taken from Oracle)
> but I'm still stuck here due to different compiling issues. I've tried to
> build my own package as well but MySQL seems to be tricky to handle in a
> toolchain. So I'm still stuck at the starting point.
> Is there someone else that has already maded it with 2011.08 buildroot ? may
> I see package files for it ?

I didn't attempt to build MySQL with Buildroot.
But, I suggest you describe the problems you experience in more
detail, then maybe someone on the list can help.

Btw, have you seen this:
http://forge.mysql.com/wiki/Linux_Cross_Compilation

(not sure if it will fix your problems though, we'd need more details.)

Best regards,
Thomas
