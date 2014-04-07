From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 7 Apr 2014 16:05:42 +0200
Subject: [Buildroot] [PATCH] Don't build host-xz needlessly
In-Reply-To: <2ba6488613955537b19028cc7284548620aef745.1396793164.git.baruch@tkos.co.il>
References: <2ba6488613955537b19028cc7284548620aef745.1396793164.git.baruch@tkos.co.il>
Message-ID: <CAAXf6LUjc-9YidqDKLdWV0QWntwLS1ZsuwWD3cbK3fUe=y0UOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Apr 6, 2014 at 4:06 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Since commit d1f325f554cab (xzcat: treat as host prerequisite and build if
> needed) host-xz is always built when the host does not have xz installed.
> Removed all other host-xz dependencies.
>
> Cc: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>


Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
