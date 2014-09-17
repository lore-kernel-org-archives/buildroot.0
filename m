From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Sep 2014 13:59:29 +0200
Subject: [Buildroot] [PATCH 2/6] python-urwid: new package
In-Reply-To: <1410953999-16520-3-git-send-email-cvubrugier@fastmail.fm>
References: <1410953999-16520-1-git-send-email-cvubrugier@fastmail.fm>
 <1410953999-16520-3-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <20140917135929.30ce158e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christophe Vu-Brugier,

On Wed, 17 Sep 2014 13:39:55 +0200, Christophe Vu-Brugier wrote:
> Urwid is a console user interface library for Python.
> 
> Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
> ---
>  package/Config.in                    |  1 +
>  package/python-urwid/Config.in       |  7 +++++++
>  package/python-urwid/python-urwid.mk | 14 ++++++++++++++
>  3 files changed, 22 insertions(+)
>  create mode 100644 package/python-urwid/Config.in
>  create mode 100644 package/python-urwid/python-urwid.mk

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Looks good to me, I've checked that the license is indeed LGPLv2.1+,
the rest of the package is quite simple and obvious.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
