From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 00:09:03 +0200
Subject: [Buildroot] [PATCH] vim: install /bin/vi as a relative symlink
In-Reply-To: <20180805144303.7624b65a@windsurf> (Thomas Petazzoni's message of
 "Sun, 5 Aug 2018 14:43:03 +0200")
References: <20180718123443.7242-1-casantos@datacom.com.br>
 <20180805144303.7624b65a@windsurf>
Message-ID: <87k1ogpwg0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Wed, 18 Jul 2018 09:34:43 -0300, Carlos Santos wrote:
 >> Prevent creating a dangling symlink when vim is not present on the host
 >> machine. With BR2_ROOTFS_MERGED_USR, just link to "vim", since they are
 >> on the same directory, otherwise link to "../usr/bin/vim".
 >> 
 >> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
 >> ---
 >> package/vim/vim.mk | 8 +++++++-
 >> 1 file changed, 7 insertions(+), 1 deletion(-)

 > I know there is some ongoing discussion on how to handle this better in
 > a more generic way, but until those discussions are resolved, I've
 > applied this patch to master.

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
