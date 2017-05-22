From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 22 May 2017 21:03:04 +0200
Subject: [Buildroot] [PATCH/next] package/bootstrap: bump version to
	3.3.7
References: <20170521181024.27233-1-bernd.kuhls@t-online.de>
 <20170522161434.4df9d628@free-electrons.com>
Message-ID: <88pbvdxolo.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 22 May 2017 16:14:34 +0200 schrieb Thomas Petazzoni:

> Changing INSTALL_TARGET_CMDS is not the right way of handling. Instead,
> the EXTRACT_CMDS should be changed to drop the useless sub-directory,
> i.e to mimic what tar --strip-components=1 does.

Hi Thomas,

is there an equivalent of --strip-components=1 for unzip?

Apparently no, unless you use some ugly script commands to move files 
around:

https://superuser.com/questions/518347/equivalent-to-tars-strip-
components-1-in-unzip

https://superuser.com/questions/443891/unzip-how-to-trim-top-directories

https://unix.stackexchange.com/questions/38162/how-can-i-force-unzip-zip-
not-to-create-a-subdirectory-when-i-extract-it

Regards, Bernd
