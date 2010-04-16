From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Apr 2010 16:42:48 +0200
Subject: [Buildroot] transmission 1.74 fails to build
In-Reply-To: <y2pe7c6a05e1004160014vf65ef3b9z1ade66ebe4bab63a@mail.gmail.com>
References: <y2pe7c6a05e1004160014vf65ef3b9z1ade66ebe4bab63a@mail.gmail.com>
Message-ID: <20100416164248.0f8890a5@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Apr 2010 09:14:41 +0200
Belisko Marek <marek.belisko@gmail.com> wrote:

> during playing with transmission package get following error:

Unless I'm missing something, transmission is not packaged in Buildroot
official source tree, is it ?

> checking pkg-config is at least version 0.9.0... ./configure: line
> 17710: /home/open-nandra/projects/buildroot/output/host/usr/bin/pkg-config:
> No such file or directory

host-pkg-config must be added to the list of dependencies of
transmission in the .mk file. If you need details, could you share your
package .mk file ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
