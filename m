From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Nov 2018 23:53:32 +0100
Subject: [Buildroot] [PATCH] zynqmp/post-image.sh: support dots in DTS
 file names
In-Reply-To: <20181025100528.23093-1-francois.beerten@colabti.org> (francois
 beerten's message of "Thu, 25 Oct 2018 12:05:28 +0200")
References: <20181025100528.23093-1-francois.beerten@colabti.org>
Message-ID: <87o9asy4gj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "francois" == francois beerten <francois.beerten@colabti.org> writes:

 > From: Francois Beerten <fbeerten.git@colabti.org>
 > Some ZynqMP device trees in the kernel have a dot in their name,
 > for example "zynqmp-zcu102-rev1.0". The post image script
 > left out the part after the dot and created an invalid symlink.

 > Signed-off-by: Francois Beerten <fbeerten.git@colabti.org>

Committed to 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
