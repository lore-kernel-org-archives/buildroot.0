From: Simon Dawson <spdawson@gmail.com>
Date: Thu, 2 Aug 2012 08:03:34 +0100
Subject: [Buildroot] Another gpsd build failure
In-Reply-To: <20120801095944.06e08366@skate>
References: <20120801095944.06e08366@skate>
Message-ID: <CAHt8ZCOJnK1AzxSSyOv+mm71rxjOS-stAOKOQkTEgqBBWc4t6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas.

On 1 August 2012 08:59, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> At
> http://autobuild.buildroot.org/results/64e7d0f0272ecafade2fbb58dfd9d72578d6c3fd/build-end.log,
> you'll find another gpsd build failure. I am not sure what the reason
> is. Maybe that host-python has been built prior to gpsd, leading to
> gpsd finding a host Python with insufficient packages. Would be good to
> investigate this.

I'll take a look as soon as possible.

Simon.
