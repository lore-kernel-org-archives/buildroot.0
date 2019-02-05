From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 15:36:21 +0100
Subject: [Buildroot] [PATCH] package/mender: fixing init script naming
In-Reply-To: <CA+_SqVaWv_DetkC=S8FUR1mBucPs0VaUxpw-CiBd8pS3zHStRA@mail.gmail.com>
 (Angelo Compagnucci's message of "Tue, 5 Feb 2019 15:28:06 +0100")
References: <1549376201-16547-1-git-send-email-angelo@amarulasolutions.com>
 <8736p2nwfx.fsf@dell.be.48ers.dk>
 <CA+_SqVaWv_DetkC=S8FUR1mBucPs0VaUxpw-CiBd8pS3zHStRA@mail.gmail.com>
Message-ID: <87tvhimhei.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

 > On Tue, Feb 5, 2019 at 3:26 PM Peter Korsgaard <peter@korsgaard.com> wrote:
 >> 
 >> >>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:
 >> 
 >> > The installed systemv script should be name S42mender and not S04mender.
 >> 
 >> You forgot to explain _WHY_, E.G. that mender needs the network to be up
 >> before it starts (presumably?)

 > It's simply a bug, the init script is already named that way!

Ahh, ok - That wasn't clear from the description. Committed with the
commit log tweaked, thanks.

-- 
Bye, Peter Korsgaard
