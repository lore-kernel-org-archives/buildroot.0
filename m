From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jun 2016 23:22:36 +0200
Subject: [Buildroot] [PATCH v2] package/fetchmail: fix *.pyc compilation
 with python-3
In-Reply-To: <20160608210638.21263-1-s.martin49@gmail.com>
References: <20160608210638.21263-1-s.martin49@gmail.com>
Message-ID: <20160608232236.1a9dbb5a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Jun 2016 23:06:38 +0200, Samuel Martin wrote:
> This change removes the fetchmailconf.py python module when the python
> interpreter is python-3, because this module is not yet python-3
> compliant.
> 
> Fixes:
>   http://autobuild.buildroot.org/results/700/7009445dd116a1c02db82a351d38db44db8dad16/
>   ...
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v1->v2:
> - remove the *.py instead of adding patches fixing it
> ---
>  package/fetchmail/fetchmail.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
