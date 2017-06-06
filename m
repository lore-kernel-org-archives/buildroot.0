From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Jun 2017 13:18:44 +0200
Subject: [Buildroot] [PATCH 1/2] ncurses: Copy terminfo for 'dumb'
	terminal
In-Reply-To: <20170604095835.7a070762@free-electrons.com> (Thomas Petazzoni's
 message of "Sun, 4 Jun 2017 09:58:35 +0200")
References: <20170603000013.5402-1-andrew.smirnov@gmail.com>
 <20170604095835.7a070762@free-electrons.com>
Message-ID: <87ink9e54b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Fri,  2 Jun 2017 17:00:12 -0700, Andrey Smirnov wrote:
 >> Definition of 'dumb' terminal is required to be able to call 'top -b'
 >> from 'procps-ng'.
 >> 
 >> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 >> ---
 >> package/ncurses/ncurses.mk | 1 +
 >> 1 file changed, 1 insertion(+)

 > Thanks both applied. Peter: since these patches are fixing runtime
 > issues, I would suggest to take them for the LTS branch as well.

Agreed. Committed to 2017.02.x and (the newly created) 2017.05.x
branches, thanks.

-- 
Bye, Peter Korsgaard
