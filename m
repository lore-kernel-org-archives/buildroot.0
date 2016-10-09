From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 22:56:58 +0200
Subject: [Buildroot] [PATCH v4 05/10] package/python-mwclient: new
 package
In-Reply-To: <20161009124625.23303-5-bernd.kuhls@t-online.de>
References: <20161009124625.23303-1-bernd.kuhls@t-online.de>
 <20161009124625.23303-5-bernd.kuhls@t-online.de>
Message-ID: <20161009225658.6a7138ad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Oct 2016 14:46:20 +0200, Bernd Kuhls wrote:
> Needed by upcoming python-mwscrape package.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v4: added upstream patch for python3 compatability (Yegor)
> v3: no changes, included in mwscrape2slob patch series
> v2: removed build dependencies (Thomas)
>     added license file; needed to add a source code file, LICENSE.md is
>     not part of the tarball provided by pypi (Thomas)

Applied to master, thanks. It would be good to contact upstream and ask
for the LICENSE.md file to be added in the tarball provided by pypi.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
