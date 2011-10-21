From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 21 Oct 2011 07:37:58 -0300
Subject: [Buildroot] [PATCH 1/4] pppd: bugfixes and enhancements
In-Reply-To: <20111021085121.13ff68d3@skate>
References: <1319132933-13938-1-git-send-email-gustavo@zacarias.com.ar>
 <20111021085121.13ff68d3@skate>
Message-ID: <f01ca2a6c070eb9cdede59ea0a984da1@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21.10.2011 03:51, Thomas Petazzoni wrote:

> Have those patches been submitted upstream ? We really don't want to
> start accumulating too many non-build related patches, such as bug
> fixes or feature additions.
>
> Thanks!
>
> Thomas

Yes.
Debian and OpenWRT have some of them too (not quite exactly the same 
but they do the same).
It's pretty likely that the default gateway patch won't be merged 
upstream from what i've read, the argument being somewhat in the lines 
of desktop security versus embedded and siding with the first. However 
it's pretty much required for openswan to work correctly or we'd have to 
do some very nasty scripts to deal with it (openswan not working out of 
the box).
Regards.
