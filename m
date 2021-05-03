From: Christian Stewart <christian@paral.in>
Date: Sun, 2 May 2021 19:45:03 -0700
Subject: [Buildroot] [PATCH v1 3/3] package/genuinetools-img: new host
 and target package
In-Reply-To: <20210503023305.161122-3-christian@paral.in>
References: <20210503023305.161122-1-christian@paral.in>
 <20210503023305.161122-3-christian@paral.in>
Message-ID: <CA+h8R2oJ8b48NdAOMLtKhAyV-KUp4uvHuyZ1eF8jDX_rw=WNrw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,


On Sun, May 2, 2021 at 7:33 PM Christian Stewart <christian@paral.in> wrote:
>
> Img is a standalone, daemon-less, unprivileged Dockerfile and OCI compatible
> container image builder. It uses the moby-buildkit solver internally. The
> commands/UX mirror the Docker CLI for workflow compatibility.
>
> Using the genuinetools- prefix due to the generic nature of the "img" name.
>
> Adds both host and target variants. fuse-overlayfs can be used as an
> unprivileged and rootless overlay filesystem backend.
>
> https://github.com/genuinetools/img

The intent here is to eventually add some kind of "download" target to
Buildroot for downloading & verifying container images as .tar.gz
files from container registries using the genuinetools-img tool - it
can "pull" and "save" using an unprivileged cache directory.

I'm not sure the best way to do this / if there is any appetite for
adding a pkg helper for this, thoughts?

Best regards,
Christian Stewart
