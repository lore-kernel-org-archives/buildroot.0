From: Simon Dawson <spdawson@gmail.com>
Date: Fri, 27 Jul 2012 13:46:13 +0100
Subject: [Buildroot] [PATCH] at91bootstrap3: new package
In-Reply-To: <20120727144014.062aad4e@skate>
References: <1343389506-7469-1-git-send-email-spdawson@gmail.com>
 <20120727140010.2a926b49@skate>
 <CAHt8ZCMbKbSJaGvT7zXi_oE2cnMBurTFL=SNwT4rrO4-O1foPQ@mail.gmail.com>
 <20120727144014.062aad4e@skate>
Message-ID: <CAHt8ZCNd6MLuHVxqQi8aer_Z8TW+TTOPK437hsHxCjo0XUbcWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas.

On 27 July 2012 13:40, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Does the kconfig in at91bootstrap3 supports savedefconfig? If it does,
> then I would prefer it we supported minimal defconfigs.

No, it doesn't support savedefconfig --- at least there is no
savedefconfig make target.

Given that the "defconfigs" are, seemingly, really "configs", do you
think I need to rename things to avoid confusion?

Simon.
