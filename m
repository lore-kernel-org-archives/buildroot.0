From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 10 Nov 2011 16:35:06 +0100
Subject: [Buildroot] Add POSTFIX package
In-Reply-To: <32819328.post@talk.nabble.com>
References: <32819328.post@talk.nabble.com>
Message-ID: <CAAXf6LVX3VyC7ky7yXMpcfALTMFpuPoVagJ5YY-BExPMEEm_yA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Nov 10, 2011 at 4:21 PM, ilranzani
<marco_cantu_ranzani@libero.it> wrote:
>
> Is possible to include the postfix (http://www.postfix.org/) package in
> Buildroot?
>
> I cross-compile with success the 2.7.1 version (for mini 2440), using the
> path/compilator/libraries of buildroot 11.08 rc2.
>
> --- But to include in buildroot needs the configure.ac or configure.in
> file!!!
>
> --- the package also fails during extraction (it is a normal .tar.gz, and
> works outside buildroot)
>
> Thanks 4 any help!!! :working:

It's fairly easy to add packages to buildroot, particularly packages
based on autotools.
There is documentation on how to do this here:
http://buildroot.uclibc.org/buildroot.html#autotools-tutorial

I suggest you give it a try and let us know if you encounter problems.
In that case, please provide some more information, like error
messages etc.

Best regards,
Thomas
