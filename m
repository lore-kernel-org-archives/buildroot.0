From: James Knight <james.d.knight@live.com>
Date: Fri, 17 Jun 2016 00:33:01 -0400
Subject: [Buildroot] [PATCH 1/1] lzop: fix for compiling host-lzop using
	gcc-6
In-Reply-To: <20160616094753.1a8d0ed8@free-electrons.com>
References: <20160616054744.4092-1-jaap@jcz.nl>
 <20160616094753.1a8d0ed8@free-electrons.com>
Message-ID: <CALAjcgXYfXN24wHCSvQpca7Kev4kvMsgi+q9HCS0gVSoCHOY8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 16, 2016 at 1:47 AM, Jaap Crezee <jaap@jcz.nl> wrote:
>
> src/miniacc.h: some changes (found upstream, but tweaked) to get gcc-6 to
> compile lzop in the form of host-lzop with a gcc-6 based host system.

Functionally works for me (i686); thanks.

On Thu, Jun 16, 2016 at 3:47 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Thanks for this new version, but there is still no description and
> Signed-off-by in the patch itself.

Yea, with a description/sign-off in the patch itself:

Acked-by: James Knight <james.d.knight@live.com>
