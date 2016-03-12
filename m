From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Mar 2016 14:11:17 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-03-11
In-Reply-To: <CAMo8BfK3F+PtfXFi1p9Z0izFX_tMvcKyCUfZDKB7MJ06AsW56g@mail.gmail.com>
References: <20160312073022.7CB43100EBF@stock.ovh.net>
 <CAMo8BfK3F+PtfXFi1p9Z0izFX_tMvcKyCUfZDKB7MJ06AsW56g@mail.gmail.com>
Message-ID: <20160312141117.530b366d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Max,

On Sat, 12 Mar 2016 11:49:03 +0300, Max Filippov wrote:
> On Sat, Mar 12, 2016 at 10:30 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Build statistics for 2016-03-11
> >       xtensa |                      mc-4.8.15 | NOK | http://autobuild.buildroot.net/results/085194f18bc7db1e801d98e6620e3a75fd988cc5/
> 
> mc's configure couldn't find S-Lang because static S-Lang build
> didn't install pkgconfig file into staging. Adding install-pkgconfig
> to SLANG_INSTALL_STAGING_OPTS fixes that.

Are you going to send a patch for that?

(My apologies if you already did, I handle e-mail in FIFO order, so I
might have not seen yet in your patch.)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
