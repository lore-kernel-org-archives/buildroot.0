From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 7 Dec 2015 12:11:02 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-12-06
In-Reply-To: <566568C4.2000100@imgtec.com>
References: <20151207073022.BE3B6101727@stock.ovh.net>
 <20151207110535.GC4258@free.fr> <566568C4.2000100@imgtec.com>
Message-ID: <20151207111102.GD4258@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2015-12-07 11:08 +0000, Vicente Olivert Riera spake thusly:
> On 07/12/15 11:05, Yann E. MORIN wrote:
> > On 2015-12-07 08:30 +0100, Thomas Petazzoni spake thusly:
> >> Build statistics for 2015-12-06
> >>         mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/11c681f344c90f7faf40ece25909cd14ad21def0/
> >>         mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/c0f8d11a3ce3b15b5d029934f938e8700ed127cd/
> > 
> > Those and similar build failures on mip64el, and due to incompatible
> > cflags passed to the compiler:
[--SNIP--]
> > Vicente, any help? ;-)
> 
> that's going to be fixed "from the root". I have sent patches to ffmpeg
> in order to improve the mips architecture handling. Some of them have
> been already applied, and the others have received positive reviews, so
> I guess is just a matter of time.
> 
> After that, we could fix that in Buildroot by either backporting patches
> or bumping the version.

Great! Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
