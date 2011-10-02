From: Luca Ceresoli <list@lucaceresoli.net>
Date: Sun, 02 Oct 2011 22:20:45 +0200
Subject: [Buildroot] [PATCH 1/6] Add basic config infrastructure for
 host utilities
In-Reply-To: <62a2ee837d283e2460ee7aaa87efec412c85e3b2.1317481137.git.thomas.petazzoni@free-electrons.com>
References: <cover.1317481137.git.thomas.petazzoni@free-electrons.com>
 <62a2ee837d283e2460ee7aaa87efec412c85e3b2.1317481137.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4E88C79D.6000503@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> Most of the host packages don't have to be exposed to the user as they
> are only used as build dependencies of target packages.
>
> However, some host utilities, such as flashing utilities, image
> creation programs, specific debuggers, might be useful and should be
> presented to the user.
>
> Therefore, we had a new global menu, which lists those host

s/had/have/

> utilities. These utilities are described in package/*/Config.in.host
> files, which will be sourced by package/Config.in.host.
>
...

Luca
