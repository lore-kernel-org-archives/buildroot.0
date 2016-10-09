From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 13:58:21 +0200
Subject: [Buildroot] [PATCH 1/3] package/python-rtslib-fb: update URL to
 the open-iscsi organization
In-Reply-To: <20161008143452.31637-1-cvubrugier@fastmail.fm>
References: <20161008143452.31637-1-cvubrugier@fastmail.fm>
Message-ID: <20161009135821.6b1ca4dc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  8 Oct 2016 16:34:50 +0200, Christophe Vu-Brugier wrote:
> Also add a comment to indicate that python-configshell-fb and
> targetcli-fb should be bumped every time python-rtslib-fb is bumped
> because upstream usually upgrades all of these packages at the same
> time.
> 
> Another comment warns that switching this package to PyPI would make us
> miss new versions of python-rtslib-fb.
> 
> Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
> ---
>  package/python-rtslib-fb/Config.in           | 2 +-
>  package/python-rtslib-fb/python-rtslib-fb.mk | 5 ++++-
>  2 files changed, 5 insertions(+), 2 deletions(-)

All three patches applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
