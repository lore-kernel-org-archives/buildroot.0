From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 10 Mar 2017 22:57:02 +0100
Subject: [Buildroot] [PATCH] package/rpi-userland: don't isntall file in
 random location
In-Reply-To: <20170310224628.12501d85@free-electrons.com>
References: <1488921388-9691-1-git-send-email-yann.morin.1998@free.fr>
 <20170310224628.12501d85@free-electrons.com>
Message-ID: <20170310215702.GA3674@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-03-10 22:46 +0100, Thomas Petazzoni spake thusly:
> On Tue,  7 Mar 2017 22:16:28 +0100, Yann E. MORIN wrote:
> > Currently, rpi-userland installs files in $(@D)/../../bin/ which is
> > entirely stupid, especially in cross-compilation.
> > 
> > Get rid of the dubious, broken, custom install command.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  ...toverlay-don-t-install-script-in-random-l.patch | 45 ++++++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> >  create mode 100644 package/rpi-userland/0006-host-apps-dtoverlay-don-t-install-script-in-random-l.patch
> 
> Applied to master after fixing the typo in the commit title. Please
> don't forget to submit upstream.

Already done 3 days ago:
    https://github.com/raspberrypi/userland/pull/380

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
