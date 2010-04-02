From: Sasha Sirotkin <buildroot@browserseal.com>
Date: Fri, 02 Apr 2010 20:52:33 +0300
Subject: [Buildroot] shared libraries with debug symbols
Message-ID: <4BB62EE1.7050409@browserseal.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It looks like " build packages with debugging symbols" does not affect 
shared libraries - even though that when it is enabled all binaries are 
copied with debug symbols shared libraries are not. Is this a bug? Any 
idea how to "fix" this?
