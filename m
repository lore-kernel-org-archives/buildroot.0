From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Apr 2019 17:39:49 +0200
Subject: [Buildroot] [PATCH v2 1/2] pkg-generic: Depend on host-{xz,
 lzip} only for fitting archives
In-Reply-To: <20190401230834.016dfe0a@windsurf> (Thomas Petazzoni's message of
 "Mon, 1 Apr 2019 23:08:34 +0200")
References: <20190317212014.3831-1-nolange79@gmail.com>
 <20190401230834.016dfe0a@windsurf>
Message-ID: <87r2agqx4q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Sun, 17 Mar 2019 22:20:13 +0100
 > Norbert Lange <nolange79@gmail.com> wrote:

 >> results in cleaner dependency graphs, and usually omits host-lzip
 >> from being built.
 >> 
 >> Signed-off-by: Norbert Lange <nolange79@gmail.com>
 >> ---
 >> package/pkg-generic.mk | 4 ++++
 >> 1 file changed, 4 insertions(+)

 > I improved the commit log, modified the code as suggested by Yann, and
 > applied. Thanks, this is a very useful change!

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
