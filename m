From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Nov 2020 22:20:26 +0100
Subject: [Buildroot] [PATCH v1] package/wpewebkit: fix compile without
 video support
In-Reply-To: <20201110221629.7011-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Tue, 10 Nov 2020 23:16:29 +0100")
References: <20201110221629.7011-1-ps.report@gmx.net>
Message-ID: <87sg9ei86d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Fixes:
 >   - https://bugs.busybox.net/show_bug.cgi?id=13306

 >       .../wpewebkit-2.30.2/Source/WebKit/WebProcess/InjectedBundle/InjectedBundle.cpp:242:30: error: ?class WebCore::Settings? has no member named ?setGenericCueAPIEnabled?; did you mean ?setBeaconAPIEnabled??
 >  page-> settings().setGenericCueAPIEnabled(enabled);
 >                                     ^~~~~~~~~~~~~~~~~~~~~~~
 >                                     setBeaconAPIEnabled

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks. Don't forget to submit the patch upstream.

-- 
Bye, Peter Korsgaard
