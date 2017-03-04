From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 04 Mar 2017 23:02:53 +0100
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 4.10.x and 3.2.x
	series
In-Reply-To: <20170303235015.39cde563@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 3 Mar 2017 23:50:15 +0100")
References: <20170302123357.1274-1-gustavo@zacarias.com.ar>
 <20170303235015.39cde563@free-electrons.com>
Message-ID: <877f44g0oi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Thu,  2 Mar 2017 09:33:56 -0300, Gustavo Zacarias wrote:
 >> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 >> ---
 >> package/linux-headers/Config.in.host | 4 ++--
 >> 1 file changed, 2 insertions(+), 2 deletions(-)

 > Both applied, thanks. Peter: I'm not sure which policy you want to have
 > in the LTS with regard to bumping kernel/kernel-headers versions, for
 > already supported branches.

I'm also not sure what the best approach is. If we do bump the version,
then what about other packages doing bugfix-only version bumps
(E.G. busybox, ..)

-- 
Bye, Peter Korsgaard
