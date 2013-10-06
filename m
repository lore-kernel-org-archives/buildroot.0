From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Oct 2013 11:11:06 +0200
Subject: [Buildroot] [PATCH] Fix glibc dependency to gcc-intermediate
In-Reply-To: <1381048066-18510-1-git-send-email-jezz@sysmic.org>
References: <1381048066-18510-1-git-send-email-jezz@sysmic.org>
Message-ID: <20131006111106.3d4984dd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Sun,  6 Oct 2013 10:27:46 +0200, J?r?me Pouiller wrote:
> In commit ebc81933, we rerverted 2babed4a, but meanwhile eglibc/ was
> renamed glibc/ so rules eglibc-build muste renmaed glibc-build to
> correctly work.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks for noticing!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
