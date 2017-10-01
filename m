From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Oct 2017 23:21:46 +0200
Subject: [Buildroot] [PATCH] package/urg: fix extraction commands
In-Reply-To: <20171001152130.2454-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 1 Oct 2017 17:21:30 +0200")
References: <20171001152130.2454-1-yann.morin.1998@free.fr>
Message-ID: <87a81aef85.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, the extraction commands entirely remove the urg directory,
 > which means the downloaded stamp will get removed, and thus a subsequent
 > build would try to re-download it.

 > It turns out that the directory extrqated by urg is already correctly
 > named, so we just need to extract out of the build directory. This
 > highly simplifies the command.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
