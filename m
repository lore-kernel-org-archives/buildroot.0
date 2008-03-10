From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Mon, 10 Mar 2008 18:13:06 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/icu
In-Reply-To: <20080310145241.B906812C734@busybox.net>
References: <20080310145241.B906812C734@busybox.net>
Message-ID: <47D55E12.6090502@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>  ICU_SOURCE:=icu$(ICU_VERSION)-src.tgz
> -ICU_SITE:=http://download.icu-project.org/files/icu4c/$(ICU_VERSION_NUM)
> +ICU_SITE:=http://superb-west.dl.sourceforge.net/sourceforge/icu
>  ICU_CAT:=$(ZCAT)

Please use sourceforge mirror variable.
Thanks!


BR,
Ivan
