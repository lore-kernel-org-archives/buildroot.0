From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Dec 2020 08:51:36 +0100
Subject: [Buildroot] [PATCH next] package/daemon: bump to version 0.7
In-Reply-To: <87im9csvgp.fsf@tarshish>
References: <1fd6d6ff9eaedda5e3b3e85c4c5c0b950dcbaec8.1605981054.git.baruch@tkos.co.il>
 <20201207225906.58a9f0db@windsurf.home> <87im9csvgp.fsf@tarshish>
Message-ID: <20201208085136.766c31b9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 08 Dec 2020 07:44:22 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> This script does only this:
> 
> case "`uname -a`" in
>         Linux*)
>                 echo "Configuring for linux"
>                 conf/linux
>                 ;;
> ...
> 
> The conf/linux script modifies a few Makefiles and headers for generic
> Linux build. Nothing architecture specific. This works because we assume
> that host and target are both Linux.

Alright, thanks for confirming!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
