From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Date: Tue, 10 Mar 2020 16:53:33 +0100
Subject: [Buildroot] [PATCH v2] package/coreutils: bump to v8.32
In-Reply-To: <20200310145656.4000-1-joaomarcos.costa@bootlin.com>
References: <20200310145656.4000-1-joaomarcos.costa@bootlin.com>
Message-ID: <20200310165333.6371fe55@joaomcosta-Latitude-E7470>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Mar 2020 15:56:56 +0100
Joao Marcos Costa <joaomarcos.costa@bootlin.com> wrote:

> The update to version 8.32 removes the need for an extra patch [1]
> (which was added in upstream) but requires another one [2] to fix a
> new build issue related to the file 'src/ls.c'.
> [1]: 0001-strtod_fix_clash_with_strtold.patch
> [2]: 0001-ls-restore-8.31-behavior-on-removed-directories.patch
 
I messed with the patch numbering, it is actually a v1.

Sorry for the mistake,
Joao Marcos
