From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 4 Feb 2018 11:05:01 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-02-03
In-Reply-To: <20180204070012.B12252125C@mail.free-electrons.com>
References: <20180204070012.B12252125C@mail.free-electrons.com>
Message-ID: <CANQCQpZen1x4OwhODXamwVSm-bH-vYjT7OJXHA=Recjmb0Ac0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Sun, Feb 4, 2018 at 8:00 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> This is the list of Buildroot build failures that occured on
> 2018-02-03, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
>
> Results for the 'master' branch
> ===============================
>
> Build failures related to your packages:
>
>      powerpc |                  raptor-2.0.15 | http://autobuild.buildroot.net/results/6826645687b7e33bfc051f288b0e30eec3bf82ca


make[4]: vfork: Resource temporarily unavailable

Looks like a fork issue on (gcc112/ppc64le)
