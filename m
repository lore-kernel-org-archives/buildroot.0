From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 24 Jul 2012 20:53:20 +0100
Subject: [Buildroot] [PATCH] gpsd: fix build issues
In-Reply-To: <1343159185-31449-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1343159185-31449-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHt8ZCNR-o1J68spjtvyiQZFdR8kx95MqHp3wT35GckLpGGr4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24 July 2012 20:46, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> The first patch gpsd-01-sconstruct-python-2.5-compat.patch is aimed at
> fixing Python 2.5 compatibility issues such as:
>
>  http://autobuild.buildroot.org/results/844a7f8698567688eba094f64dd2bf5157efd994/build-end.log
>
> The second patch gpsd-02-sconstruct-ncurses-config-path.patch
> implements a proper mechanism to specify the path to
> ncurse5-config. It obsoletes the previous
> gpsd-fix-acs_map-compile-errors patch, and solves build problems such
> as:
>
>  http://autobuild.buildroot.org/results/92ae3d53e8aa68d8b1a2eccad68c98f577cb6437/build-end.log
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Simon Dawson <spdawson@gmail.com>
