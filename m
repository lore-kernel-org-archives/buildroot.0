From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Dec 2018 11:27:37 +0100
Subject: [Buildroot] [PATCH v2 2/3] system cfg: set mkpasswd default to
 SHA256
In-Reply-To: <1544061989-7450-2-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Wed, 5 Dec 2018 20:06:28 -0600")
References: <1544061989-7450-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1544061989-7450-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87r2ejaxuu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > This patch changes the default mkpasswd method to SHA256 from MD5.
 > The change both improves the quality of the hash used and prepares
 > for eventually removing MD5 as a option.

 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 > ---
 > Changes
 > v2 - New patch

Changing defaults is always tricky, but considering that the next
release will become LTS I think it will be OK.

Committed, thanks.

-- 
Bye, Peter Korsgaard
