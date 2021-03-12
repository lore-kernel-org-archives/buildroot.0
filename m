From: Christian Stewart <christian@paral.in>
Date: Fri, 12 Mar 2021 13:00:19 -0800
Subject: [Buildroot] [RFC] rename docker-containerd package to containerd?
Message-ID: <CA+h8R2pH1sffW6iJFZKdxB71ke1nhtSFdCr=x3MzsyVqiXNe1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

When introduced, the docker-containerd package was associated with
Docker Engine.

Now, the project is independent and called simply "containerd."

https://github.com/containerd/containerd

Is it worthwhile / standard practice to rename the Buildroot package
to "containerd"? The package is already independent from Docker.

There would need to be mappings from the legacy Config.in entries.

Thanks & best regards,
Christian Stewart
