From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 21:48:23 +0100
Subject: [Buildroot] [PATCH 1/2] libuecc: add new package
In-Reply-To: <1446102782-4565-1-git-send-email-post@lespocky.de>
References: <1446102782-4565-1-git-send-email-post@lespocky.de>
Message-ID: <20151104214823.5b2205ba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexander Dahl,

On Thu, 29 Oct 2015 08:13:01 +0100, Alexander Dahl wrote:
> This package is a small library used for the Freifunk Gluon project and
> will be used by other upcoming packages. It's my first buildroot package
> and I tried to follow the documentation as close as possible, however as
> you might suppose I'm open for any suggestions.
> 
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
>  package/Config.in          |  1 +
>  package/libuecc/Config.in  |  6 ++++++
>  package/libuecc/libuecc.mk | 13 +++++++++++++
>  3 files changed, 20 insertions(+)
>  create mode 100644 package/libuecc/Config.in
>  create mode 100644 package/libuecc/libuecc.mk

I've applied your patch, thanks! There were two minor issues:

 - The commit log should not contain some "personal" messages such as
   "It's my first buildroot package...". The contents of the commit log
   is kept forever in the project history. If you want to include such
   "personal/contextual" messages, put them either in a separate e-mail
   (called the cover letter) or under the --- sign below the
   Signed-off-by line.

 - There was a line with trailing spaces in Config.in.

Other than that, looked good to, so applied!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
