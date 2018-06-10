From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 10 Jun 2018 20:23:05 -0300
Subject: [Buildroot] [PATCH 1/2 v3] support/docker: sort the list of
 installed packages
References: <31dc2172ac9fba9527eec403868e3dc82c6f7ce8.1528645489.git.yann.morin.1998@free.fr>
Message-ID: <5b1db2d939b1c_5fc53fa25a012638164d0@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Jun 10, 2018 at 12:44 PM, Yann E. MORIN wrote:

> As suggested in the docker best practices [0], order the package list
> alphabetically, and list only one package per line.
> 
> This will be much usefull later, we need to update the list of installed
> packages, like adding new ones for example.
> 
> [0] https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#sort-multi-line-arguments
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>


Regards,
Ricardo
