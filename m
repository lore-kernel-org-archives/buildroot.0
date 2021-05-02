From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 May 2021 09:55:48 +0200
Subject: [Buildroot] [RFC] rename docker-containerd package to
 containerd?
In-Reply-To: <CA+h8R2pH1sffW6iJFZKdxB71ke1nhtSFdCr=x3MzsyVqiXNe1A@mail.gmail.com>
 (Christian Stewart's message of "Fri, 12 Mar 2021 13:00:19 -0800")
References: <CA+h8R2pH1sffW6iJFZKdxB71ke1nhtSFdCr=x3MzsyVqiXNe1A@mail.gmail.com>
Message-ID: <87o8dt4liz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Hi all,
 > When introduced, the docker-containerd package was associated with
 > Docker Engine.

 > Now, the project is independent and called simply "containerd."

 > https://github.com/containerd/containerd

 > Is it worthwhile / standard practice to rename the Buildroot package
 > to "containerd"? The package is already independent from Docker.

 > There would need to be mappings from the legacy Config.in entries.

Fine by me. Care to send a patch?

-- 
Bye, Peter Korsgaard
