From: Chris Packham <judge.packham@gmail.com>
Date: Fri, 16 Oct 2020 10:33:14 +1300
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-10-14
In-Reply-To: <5f87f5a4.1c69fb81.d48c1.9811SMTPIN_ADDED_MISSING@mx.google.com>
References: <5f87f5a4.1c69fb81.d48c1.9811SMTPIN_ADDED_MISSING@mx.google.com>
Message-ID: <CAFOYHZA9MRAh3FiN6J3KQMZU+YZ_bfTGQ42PJ_wzc7z6Pic5Xg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 15, 2020 at 8:09 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Autobuilder failures
> ====================
>
> Below is a list of build failures reported by the Buildroot
> autobuilders in relation to packages or CPU
> architectures you are in charge of. Please help us
> improving the quality of Buildroot by investigating
> those build failures and sending patches to fix
> them.Thanks!
>
> Results for the 'master' branch
> -------------------------------
>
> Build failures related to your packages:
>
>     arch     |             reason             |                                       url
> -------------+--------------------------------+---------------------------------------------------------------------------------
>    xtensa    |        micropython-1.13        | http://autobuild.buildroot.net/results/174b825379b0f025b0512a3fafd17235c9914a03
>

The error is complaining about some in-line asm code. I don't know
much about xtensa so I've raised an upstream issue
https://github.com/micropython/micropython/issues/6551
