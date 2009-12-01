From: Joachim Pihl <jpihl@nevion.com>
Date: Tue, 1 Dec 2009 09:36:06 +0100
Subject: [Buildroot] Where did "project name" go?
Message-ID: <op.u383h9jpyqa4qb@jap>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


There is no longer an option "Project name" under target options. Why was  
this removed for 2009.11? It seems to me that some essential functionality  
is lost due to this when you target multiple platforms. It seems to me  
that I have to run make distclean, then make xconfig, when switching  
target configurations for the next target to build cleanly.

-- 
Joachim Pihl
Senior R&D Engineer
Nevion Europe

Tel: +47 33 48 94 66
Fax: +47 33 48 99 98
Mobile: +47 91 33 98 91
jpihl at nevion.com
www.nevion.com

------------------------------------------------------
The Global Video Transport Leader
------------------------------------------------------
