From: Cam Hutchison <camh@xdna.net>
Date: Sat, 13 Apr 2019 07:29:50 +1000
Subject: [Buildroot] [PATCH 1/1] pkg-golang: Allow per package/target
 CGO_ENABLED setting
In-Reply-To: <CA+h8R2rAOmstP8C1yni+MBzRhm9FbT66Vfy+SYRKG91j8JRJqg@mail.gmail.com>
References: <20180727024720.13370-1-camh@xdna.net> <20190407214941.GA3117@jaya>
 <87pnpxfe8b.fsf@paral.in> <20190408090458.49e1e5cc@windsurf>
 <CABa6e=oAUccKG8mQh4NCZx6Oq6swgQZMCE7atN4Xeb0s3EcqXg@mail.gmail.com>
 <CA+h8R2rAOmstP8C1yni+MBzRhm9FbT66Vfy+SYRKG91j8JRJqg@mail.gmail.com>
Message-ID: <CABa6e=r98Ma20_gXduMjoZ6e49EzoqHMhZtZmR8bGtww8WSt1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 9 Apr 2019 at 13:22, Christian Stewart <christian@paral.in> wrote:
>
> Fwiw, I'm also integrating kubernetes with buildroot at the moment. I don't see where cgo is required in this way.
>
> I'd be happy to compare notes if you'd like?

My local BR2_EXTERNAL kubernetes config is at
https://github.com/camh-/clusterpi/tree/master/package/kubernetes.
Feel free to take anything from there that is useful.

I'm going to look at k3s instead now (https://github.com/rancher/k3s)
for its smaller size - probably more appropriate for my targets.

Regards,
Cam
