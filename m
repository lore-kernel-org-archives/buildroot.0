From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Jan 2009 16:06:11 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/webkit
In-Reply-To: <C13DBBE85AD6974B85C118C35890CA5F1AF38F7666@EU1RDCRDC1WX029.exi.nxp.com>
	(Daniel James Laird's message of "Tue\,
	27 Jan 2009 11\:15\:33 +0100")
References: <20090123174908.81999769CC@busybox.osuosl.org>
	<20090127002732.GB1083@cloud.net.au>
	<COL102-W811D43396757A885D85C94DCCB0@phx.gbl>
	<87zlhd15zu.fsf@macbook.be.48ers.dk>
	<C13DBBE85AD6974B85C118C35890CA5F1AF38F7666@EU1RDCRDC1WX029.exi.nxp.com>
Message-ID: <871vuo23h8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel James Laird <daniel.j.laird@nxp.com> writes:

 Daniel> Feel free to remove the X dependency,
 Daniel> I was intending to update webkit after release......

Done. Are you able to compile it with gcc 4.3.2? The version we have
in svn seems to die for me with:

./WebCore/bridge/npapi.h:252: error: expected ';' before '*' token
./WebCore/bridge/npapi.h:253: error: 'Colormap' does not name a type
./WebCore/bridge/npapi.h:452: error: 'XEvent' does not name a type
./WebCore/bridge/npapi.h:473: error: 'Region' does not name a type
./WebCore/bridge/npapi.h:705: error: 'NPRegion' has not been declared
In file included from ./WebCore/bridge/npruntime_internal.h:29,
                 from ./WebCore/plugins/PluginPackage.h:35,
                 from ./WebCore/plugins/PluginDatabase.h:31,
                 from WebKit/gtk/WebCoreSupport/FrameLoaderClientGtk.cpp:37:
./WebCore/plugins/npfunctions.h:57: error: 'NPRegion' has not been declared

-- 
Bye, Peter Korsgaard
