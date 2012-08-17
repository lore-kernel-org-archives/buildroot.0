From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Fri, 17 Aug 2012 08:46:32 -0400
Subject: [Buildroot] Suggestion: increase username buffer size in
	busybox login
In-Reply-To: <20120817143017.65099bd6@skate>
References: <CADiAo4LZ0e=Goo13SKodFo6PL0iEsVG5tPsdQ6jp6yhOsBX4DQ@mail.gmail.com>
 <201208141907.13002.yann.morin.1998@free.fr>
 <CADiAo4Jn7525qF0+_mXhDT2j5-k+W-SCsXf1x8oaAEuNvWz66g@mail.gmail.com>
 <20120817143017.65099bd6@skate>
Message-ID: <CADiAo4LX4q5Vxrw_Hje34DjzkDjKo8-MpdZzT-xN6MVUHSwuUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Aug 17, 2012 at 8:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

> This should not be implemented in Buildroot, as we don't want to keep
> such "feature" patches on our packages. Make a patch to Busybox that
> turns this into a configurable value, so that by default the length of
> 32 characters is used, but a Busybox configuration option allows to
> extend that. Then, Buildroot users interested by this feature can
> create a custom Busybox configuration.

Busybox developers increased this length to 64 for now ;) It is in the
daily snapshot and eventually will propagate to Buildroot (or can even
be enabled now by selecting daily snapshot).

Maybe this will be sufficient.

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
