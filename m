From: Steve Calfee <stevecalfee@gmail.com>
Date: Tue, 15 Jan 2013 15:22:28 -0800
Subject: [Buildroot] [git commit] openvpn: fix init script name
In-Reply-To: <20130115204907.6290399699@busybox.osuosl.org>
References: <20130115204907.6290399699@busybox.osuosl.org>
Message-ID: <CAJJ6jxukk2pGwL9Y3US7W0u488jKk52EgB4LJcnF4uUtQN66Lg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 15, 2013 at 12:34 PM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=41fb3df4bd370b869fea3d0b38d01f596f86f721
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Our default (busybox) rc.S implementation requires init scripts to be
> named S??*, so rename the openvpn one to S60openvpn (E.G. after network).
>

What you are proposing would work, but we already have S60nfs in
init.d. why not call your new start script S61? No big deal o does
come after n, just asking.

Regards, Steve
