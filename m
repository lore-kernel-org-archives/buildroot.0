From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 10 Aug 2018 12:18:43 -0500
Subject: [Buildroot] buildroot, python{,3}, and pip
In-Reply-To: <CAF_dkJCw8P3YcUOgsODcrX_YrdYaYfcxriBFs+dxRSRjUrXf+w@mail.gmail.com>
References: <CAF_dkJCw8P3YcUOgsODcrX_YrdYaYfcxriBFs+dxRSRjUrXf+w@mail.gmail.com>
Message-ID: <CANQCQpaoC1yKV=ayMYahAk9BsdXvk1yuNYWNK=LshdcEHBM1mg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patrick,
On Fri, Aug 10, 2018 at 12:11 PM Patrick Doyle <wpdster@gmail.com> wrote:
>
> Does anybody have experience using pip on a buildroot generated system?
>
> Poking around, I have found patches to add a python-pip module, (for
> example http://lists.busybox.net/pipermail/buildroot/2013-July/075194.html)
> but I don't see that in my 2018.02 release.
>

It was actually just merged yesterday to the next branch and will hit
master for the 2018.11 release cycle.  You can definitely pick it into
your local copy for use now.
