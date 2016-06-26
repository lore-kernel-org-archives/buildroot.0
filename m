From: Erico Nunes <nunes.erico@gmail.com>
Date: Sun, 26 Jun 2016 23:23:00 +0200
Subject: [Buildroot] [PATCH 1/1] efivar: depends on target gcc >= 4.7
In-Reply-To: <20160626225906.1e19a695@free-electrons.com>
References: <20160626205424.6082-1-nunes.erico@gmail.com>
 <20160626225906.1e19a695@free-electrons.com>
Message-ID: <CAK4VdL2gA3U1BaH20cic5Uf1ZB_n=azezqyeMnKYHEAZvs9ZfA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Jun 26, 2016 at 10:59 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Thanks for the patch. However, when you introduce a new dependency to a
> package, you must propagate it to the reverse dependencies of that
> package. In this case, the efibootmgr also needs to get the gcc >= 4.7
> dependency.
>
> Could you adjust this and send an updated version?

Right, missed that detail this time.
Thanks for reviewing and pointing it out, I'll send an updated version.

Erico
