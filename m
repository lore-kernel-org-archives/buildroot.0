From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:46:54 +0200
Subject: [Buildroot] [PATCH v2 4/5] python-configshell-fb: new package
In-Reply-To: <1411034455-19670-5-git-send-email-cvubrugier@fastmail.fm>
References: <1411034455-19670-1-git-send-email-cvubrugier@fastmail.fm>
 <1411034455-19670-5-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <20140921194654.592f3b45@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christophe Vu-Brugier,

On Thu, 18 Sep 2014 12:00:54 +0200, Christophe Vu-Brugier wrote:
> configshell-fb is a Python library that provides a framework for
> building simple but nice CLI-based applications.
> 
> Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/Config.in                                      |  1 +
>  package/python-configshell-fb/Config.in                | 11 +++++++++++
>  package/python-configshell-fb/python-configshell-fb.mk | 14 ++++++++++++++
>  3 files changed, 26 insertions(+)
>  create mode 100644 package/python-configshell-fb/Config.in
>  create mode 100644 package/python-configshell-fb/python-configshell-fb.mk

Applied, thanks.

I have prepared some patches to fix the PEP 3147 issues with Python 3,
I hope to send them soon. If you have a bit of time to test them with
those new packages, and maybe re-enable them for Python 3, it would be
great.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
