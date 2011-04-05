From: Heyendal, Carl <CHeyendal@stanleyworks.com>
Date: Tue, 5 Apr 2011 12:13:43 -0400
Subject: [Buildroot] debugging threads
Message-ID: <1D6034426110564DA0DEA9EE9793B38358192AAA2C@NBE-MBX01.americas.swk.pri>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Please indulge me asking this question here. I know my question is out of the scope for this group but I know of no other group that could probably help me more as this one, as everyone here likely uses remote debugging. I'm frustrated because I'm getting nowhere with other groups in regard to my problem(s).

My question regards remote debugging of threads using Eclipse. I have a little app that prints "Hello World' from main() and again from a thread. That's it.

As a local app on my workstation, I can place a breakpoint in the thread and GDB will stop at the break point, refresh the Debug window with all the new thread information, and show the breakpoint in the source window...all automatically. 

But when I do this with the same app running remotely on my target I have to watch the debug window and when the I notice that the original thread is suspended I have to click the refresh button to get the debug window to update the new thread information, open the new thread that is marked as 'hit breakpoint', and click the last function in the stack indicating the breakpoint before I can see it in the source.

The remote app works perfectly when run from GDB stand-alone so it must be an Eclipse issue. I'm using GDB (DSF) Remote System Process Launcher in my debug configuration.

Shouldn't this be as automatic as debugging a local app? Do other people bother debugging from Eclipse because of quirks like this?

Correspond off-line if you wish.

Appreciate any help.

thanx
/carl
