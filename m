From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 21:08:01 +0200
Subject: [Buildroot] [PATCH 3/3] package/bash: drop SHOBJ_STATUS from
 BASH_CONF_ENV
In-Reply-To: <20210423202356.37681-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 23 Apr 2021 22:23:55 +0200")
References: <20210423202356.37681-1-thomas.petazzoni@bootlin.com>
 <20210423202356.37681-3-thomas.petazzoni@bootlin.com>
Message-ID: <87r1iwhnji.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > SHOBJ_STATUS=unsupported was added in commit
 > 4a2af11cba83ef176672609dd7321712fa7f6a28 to work around a limitation
 > of the configure script that forgot to set this variable in
 > static-linking configurations.

 > It turns out that this issue has been fixed upstream as of bash 5.0:

 >   https://git.savannah.gnu.org/cgit/bash.git/diff/configure.ac?id=d233b485e83c3a784b803fb894280773f16f2deb

 >   (see hunk @@ -1151,6 +1179,9 @@)

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Baruch Siach <baruch@tkos.co.il>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
