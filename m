From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jul 2014 10:53:47 +0200
Subject: [Buildroot] [PATCH 1/6 v2] support/download: fix the bzr helper
In-Reply-To: <d03ce86b10d501c424a49afe348d0a8159acf929.1404769268.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 7 Jul 2014 23:44:32 +0200")
References: <cover.1404769268.git.yann.morin.1998@free.fr>
 <d03ce86b10d501c424a49afe348d0a8159acf929.1404769268.git.yann.morin.1998@free.fr>
Message-ID: <87vbr8z0x0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > bzr uses the name of the extension of the output file to known what
 > output format to use: tar, tgz, tar.bz2... If no extension is
 > recognised, bzr will output to a directory.

 > Since we use 'mktemp .XXXXXX' to generate temporary files, it obviously
 > never ends with a recognised extension. Thus, bzr expects the output to
 > be a directory, and fails since it is a file.

 > Fix that by forcing the output format.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
