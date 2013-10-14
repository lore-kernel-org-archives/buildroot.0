From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Oct 2013 13:52:11 -0300
Subject: [Buildroot] [PATCH 1/3] libevent: add host variant
In-Reply-To: <20131014184524.08e82914@skate>
References: <1381760111-1271-1-git-send-email-gustavo@zacarias.com.ar>	<20131014183922.75e02953@skate>	<525C1E7C.2090604@zacarias.com.ar>
 <20131014184524.08e82914@skate>
Message-ID: <525C213B.1080707@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/14/2013 01:45 PM, Thomas Petazzoni wrote:

>> Apache thrift, upcoming package, same as host-boost.
> 
> Then please say so, or include such packages in the patch series.
> Otherwise, there's no way for us, mere reviewers, to know what's coming
> next in your patch queue.

That's because i wanted to send the boost bump breakage fix and it was
on top of what i've already had done to boost.
Thrift needs some more testing and i didn't want to hold the fix back
(and also a filename collision fix with python-thrift because someone
thought it was wise to use the same naming convention for tarballs as
the upstream project for a subset of said thing).
Regards.
