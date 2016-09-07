From: Theo Debrouwere <t.debrouwere@televic.com>
Date: Wed,  7 Sep 2016 17:21:04 +0200
Subject: [Buildroot] pugixml: new package
In-Reply-To: <20160904210846.1332-1-theo.debrouwere@skynet.be>
References: <20160904210846.1332-1-theo.debrouwere@skynet.be>
Message-ID: <20160907152105.28350-1-t.debrouwere@televic.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I fixed all the mentioned issues, except:
> +LIBPUGIXML_SUBDIR = scripts

In this release, CMakelists.txt is located in a subfolder.

This has been fixed in the git tree, but that hasn't been released yet.
