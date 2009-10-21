From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 21 Oct 2009 16:37:21 +0200
Subject: [Buildroot] problem solved : configure:1745: error: C compiler
	cannot create executables
Message-ID: <57DB4D275D074D809847969FA4D2D702@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
 
The problem was the name of the cache directoy variable 
 
I used my .config from the 2009.08 in the current release version.
 
 
in the 2009.08 release :
BR2_CCACHE_DIR="$(TOOL_BUILD_DIR)/ccache-$(CCACHE_VER)/cache"

now the line reads 

BR2_CCACHE_DIR="$(TOOLCHAIN_DIR)/ccache-$(CCACHE_VER)/cache"

Johan

 

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091021/364ec8d3/attachment-0001.htm>
