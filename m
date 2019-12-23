From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 09:04:06 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/pango: needs libfribidi
In-Reply-To: <20191209205224.2762-2-ps.report@gmx.net> (Peter Seiderer's
 message of "Mon, 9 Dec 2019 21:52:24 +0100")
References: <20191209205224.2762-1-ps.report@gmx.net>
 <20191209205224.2762-2-ps.report@gmx.net>
Message-ID: <875zi7xybt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Fixes:
 >   http://autobuild.buildroot.net/results/f16fda910da23dfe5f8ac1cb51f9dbcec444b516

 >   subprocess.CalledProcessError: Command '['git', 'clone', 'https://github.com/fribidi/fribidi.git', 'fribidi']' returned non-zero exit status 128.

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
