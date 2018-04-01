From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Apr 2018 22:57:33 +0200
Subject: [Buildroot] [PATCH v2 2/2] coreutils: use single binary in
 symlink method
In-Reply-To: <20180401153905.14483-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 1 Apr 2018 17:39:05 +0200")
References: <20180401153905.14483-1-thomas.petazzoni@bootlin.com>
 <20180401153905.14483-3-thomas.petazzoni@bootlin.com>
Message-ID: <877epqpruq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > From: Carlos Santos <casantos@datacom.ind.br>
 > The symlink method is faster, since there is no shell fork/exec, and
 > provides extra space savings.

 > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
 > [Thomas: use the symlinks method not only for the merged /usr case,
 > but also in the non-merged case to be consistent, and therefore adjust
 > the logic that was moving the shell wrappers to a logic that recreates
 > the symlinks.]
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
