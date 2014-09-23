From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 23 Sep 2014 10:42:23 +0100
Subject: [Buildroot] [PATCH] ncurses: Add libcurses symlink to libncurses
In-Reply-To: <20140923113820.1e06567e@free-electrons.com>
References: <1411464791-8023-1-git-send-email-Vincent.Riera@imgtec.com>
 <20140923113820.1e06567e@free-electrons.com>
Message-ID: <5421407F.2090204@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/23/2014 10:38 AM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
>
> On Tue, 23 Sep 2014 10:33:11 +0100, Vicente Olivert Riera wrote:
>> Some packages use -lcurses when they are linking, so they try to link to
>> a library called libcurses. The library provided by our ncurses package
>> is called libncurses, so those packages fail to link with a message like
>> this one:
>
> Can you define "some" in "Some packages" ?
>
> Thanks!
>
> Thomas

Hi Thomas,

there is an autobuild report at the bottom of the commit message where 
you can see a package which is failing due to that problem.

-- 
Vincent
