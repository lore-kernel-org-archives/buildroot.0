From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Nov 2013 11:26:20 +0100
Subject: [Buildroot] [PATCH 4/5] rpi: rename board folder for consistency
In-Reply-To: <20131106111103.1a1f1d13@skate>
References: <cover.1383693880.git.yann.morin.1998@free.fr>
 <5db8e0c38bc04628a5286eb3c90ab0c0ee543b53.1383693880.git.yann.morin.1998@free.fr>
 <20131106111103.1a1f1d13@skate>
Message-ID: <201311061126.20888.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Wednesday 06 November 2013 11:11:03 Thomas Petazzoni wrote:
> On Wed,  6 Nov 2013 00:28:19 +0100, Yann E. MORIN wrote:
> > From: mathieu benoit <mathieu.benoit@savoirfairelinux.com>
> > 
> > All the Raspberry Pi files (packages and config) are prefix with
> > "rpi", so rename the board directory to "rpi" for consistency.
> > 
> > Signed-off-by: Mathieu Benoit <mathieu.benoit@savoirfairelinux.com>
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  board/{raspberrypi => rpi}/readme.txt | 0
> >  1 file changed, 0 insertions(+), 0 deletions(-)
> >  rename board/{raspberrypi => rpi}/readme.txt (100%)
> 
> I'm not sure I agree with this one. I find "rasberrypi" a lot more
> obvious for the new comer. Maybe our defconfig should also be called
> rasberrypi_defconfig.

Well, 'rpi' is a very common nickname for the Raspberry Pi, so I don't
think there will be confusion for a newcomer (to Buildroot).

On the other hand, all our other boards are using the full name, not a
shortname/nickname, neither in board/ nor in configs/

So, in hindsight, I agree with Thomas here: we should use raspberrypi,
not rpi.

I'll fix and resubmit.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
