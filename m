From: Michael S. Zick <minimod@morethan.org>
Date: Thu, 8 Dec 2011 17:49:21 -0600
Subject: [Buildroot] Device files and Buildroot
In-Reply-To: <CAMP44s0bpx_mJRG=4bz5yhewujwaAhC1tQqqWNyCCbtNZysRgg@mail.gmail.com>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <20111203092553.0acf80a5@skate>
 <CAMP44s0bpx_mJRG=4bz5yhewujwaAhC1tQqqWNyCCbtNZysRgg@mail.gmail.com>
Message-ID: <201112081749.25028.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu December 8 2011, Felipe Contreras wrote:
> On Sat, Dec 3, 2011 at 10:25 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Le Sat, 3 Dec 2011 01:25:41 +0100,
> > Aleksander Dutkowski <adutkowski@gmail.com> a ?crit :
> >
> >> "System configuration --> Custom script to run before creating
> >> filesystem image" input is for specify a PATH to bash script.
> >> You you must simply create script, fill with mknod commands (remember
> >> - mknod can be ran only by root! so do 'sudo mknod')
> >
> > No, no, no and no ! I'm sorry but this is totally horrible and is
> > definitely not the way of doing things with Buildroot.
> >
> > With Buildroot, you have four ways of managing the device files
> > in /dev. The mechanism used to manage device files is configured from
> > System configuration -> /dev management. The four ways are :
> 
> Why is this not described when one press '?' on the menu options?
>

Because you haven't sent the patch for the menu that does that yet.

Mike 
> Cheers.
> 
