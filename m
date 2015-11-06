From: James Knight <james.knight@rockwellcollins.com>
Date: Fri, 6 Nov 2015 11:07:09 -0500
Subject: [Buildroot] [PATCH v2 3/3] gpsd: disable attempt to reload
	systemd
In-Reply-To: <20151105223959.26c4af78@free-electrons.com>
References: <1446748914-12628-1-git-send-email-james.knight@rockwellcollins.com>
 <1446748914-12628-3-git-send-email-james.knight@rockwellcollins.com>
 <20151105223959.26c4af78@free-electrons.com>
Message-ID: <CALe+oY96yQYW+0V8gK++ufdHogzV=QwrQK1g31A358jetWCa=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, Nov 5, 2015 at 4:39 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> rather than this $(SED) expression, could you
> create a proper patch against the gpsd sources ?

Gah! I was going to make a patch but figured the SED option would be
preferred. Oops.

I take at look trying to get these changes (this and the other patch
related to gpsd udev) upstream.

As always, thanks for the commits/comments.
